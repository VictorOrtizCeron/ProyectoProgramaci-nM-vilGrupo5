import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'Comida a domicilio en pocos clics',
      'es': 'Comida a domicilio en pocos clics',
    },
    'q7mzy88d': {
      'en':
          'Disfruta del los mejores maricos de la zona, con nuestros fantasticos platillos.',
      'es':
          'Disfruta de los mejores maricos de la zona, con nuestros fantásticos platillos.',
    },
    '2044raxp': {
      'en': 'Crear cuenta',
      'es': 'Crear cuenta',
    },
    'kvk96b9a': {
      'en': 'Usar cuenta existente',
      'es': 'Usar cuenta existente',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CreateAccount
  {
    'fqhfxosd': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '8r2ftoyt': {
      'en': 'Start learning with create your account',
      'es': 'Empieza a aprender creando tu cuenta',
    },
    '5ejt2igx': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
    },
    '1k2s07d4': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
    },
    '8hrnyurr': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '5ta75wx9': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
    },
    '7318gst0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'tj5ofugi': {
      'en': 'Have an acccount',
      'es': 'Tener una cuenta',
    },
    '96k4zm5b': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'i6bq0pen': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Login Account',
      'es': 'Iniciar sesión en la cuenta',
    },
    '7yyc6yio': {
      'en': 'Please login with registered account',
      'es': 'Por favor, inicie sesión con una cuenta registrada',
    },
    '0y1a56v9': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
    },
    'xq55heau': {
      'en': 'Enter your email...',
      'es': 'Introduce tu email...',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'tec1pifi': {
      'en': 'Write your password...',
      'es': 'Escribe tu contraseña...',
    },
    'urzirdij': {
      'en': 'Registrate Aqui!',
      'es': '¡Regístrate aquí!',
    },
    '3ev1m26j': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '58ybobvm': {
      'en': 'Signin',
      'es': 'Iniciar sesión',
    },
    'cy7y6bn2': {
      'en': 'Or using other method',
      'es': 'O utilizando otro método',
    },
    'qwppiiww': {
      'en': 'Contact support!',
      'es': '¡Contacta con soporte técnico!',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // HistorialPedidos
  {
    'i78vidqg': {
      'en': 'Mis Ordenes',
      'es': 'Mis órdenes',
    },
    '5dnqugbt': {
      'en': 'Activos',
      'es': 'Activos',
    },
    'q1zvqh2a': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    '1dh22zz4': {
      'en': 'Fecha',
      'es': 'Fecha',
    },
    'wsvk3s1k': {
      'en': 'Precio',
      'es': 'Precio',
    },
    'lg9gdklp': {
      'en': 'Detalle',
      'es': 'Detalle',
    },
    '42hehwip': {
      'en': 'Historial',
      'es': 'Histórico',
    },
    'hmdvxxgk': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    'sbe46auv': {
      'en': 'Fecha',
      'es': 'Fecha',
    },
    'patrq0wt': {
      'en': 'Precio',
      'es': 'Precio',
    },
    'opi3blqy': {
      'en': 'Detalle',
      'es': 'Detalle',
    },
    '10momek7': {
      'en': 'Rastrear',
      'es': 'Rastrear',
    },
    '460io703': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
    },
  },
  // Detail
  {
    'mnx04jee': {
      'en': 'Detalle del platillo',
      'es': 'Detalle del platillo',
    },
    'r8xqexim': {
      'en': 'Descripción',
      'es': 'Descripción',
    },
    '8u283qs4': {
      'en': 'Locación',
      'es': 'Ubicación',
    },
    'cjnow4du': {
      'en': 'Open Location',
      'es': 'Ubicación abierta',
    },
    'xv6cwiei': {
      'en': 'Añadir',
      'es': 'Añadir',
    },
    'bzzsk2tt': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Notifications
  {
    '7xeyt3wn': {
      'en': 'Notification',
      'es': 'Notificación',
    },
    'v9zj1lqj': {
      'en': 'Today',
      'es': 'Hoy',
    },
    'oqbwrpnh': {
      'en': 'Discount voucher!',
      'es': '¡Cupón de descuento!',
    },
    'h1prwlxt': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
    },
    'etwd1z7n': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
    },
    'v0ypysbt': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
    },
    'geyy08x6': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
    },
    'sg7ky4vq': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
    },
    'lehiwmn2': {
      'en': 'Discount voucher! 50%',
      'es': '¡Cupón de descuento! 50%',
    },
    '8ccbuyp1': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas y 60 minutos',
    },
    'wh324nbh': {
      'en': 'Yesterday',
      'es': 'Ayer',
    },
    'k3pnpz7c': {
      'en': 'Discount voucher!',
      'es': '¡Cupón de descuento!',
    },
    '544pu051': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
    },
    'a7l0sc65': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
    },
    'g3f0az5d': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
    },
    '2to6yrso': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
    },
    'o2xb50hb': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
    },
    '514iimtt': {
      'en': 'Discount voucher! 50%',
      'es': '¡Cupón de descuento! 50%',
    },
    'hspwuxdq': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas y 60 minutos',
    },
    'j6d49hyr': {
      'en': 'Discount voucher! 50%',
      'es': '¡Cupón de descuento! 50%',
    },
    'fggqlhln': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas y 60 minutos',
    },
    'p9pn3mm5': {
      'en': 'Favorite',
      'es': 'Favorito',
    },
  },
  // Setting
  {
    '82jnfyxo': {
      'en': 'Setting',
      'es': 'Configuración',
    },
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'ds506agm': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
    },
    '9b6hsp48': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'rnd1sxmy': {
      'en': 'Notification Setting',
      'es': 'Configuración de notificaciones',
    },
    '3vea7j2p': {
      'en': 'Language',
      'es': 'Idioma',
    },
    'cow5ksut': {
      'en': 'Preferencess',
      'es': 'Preferencias',
    },
    'ivdshgsr': {
      'en': 'Legal and Policies',
      'es': 'Legal y políticas',
    },
    '33gpjjpl': {
      'en': 'Help & Support',
      'es': 'Ayuda y soporte',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    'ihvwbj05': {
      'en': 'Foodcort Version 1.0.12 Build 24',
      'es': 'Foodcort Versión 1.0.12 Build 24',
    },
    'tpcxi4d9': {
      'en': 'Setting',
      'es': 'Configuración',
    },
  },
  // ChangePassword
  {
    'qta47nw1': {
      'en': 'Recover Password',
      'es': 'Recuperar contraseña',
    },
    'tubwwdsg': {
      'en':
          '¿Olvidaste tu contraseña? Recupérala aquí.\n\nNo puedes acceder a tu cuenta, restablece tu contraseña.',
      'es':
          '¿Olvidaste tu contraseña? Recupérala aquí.\n\nNo puedes acceder a tu cuenta, restablece tu contraseña.',
    },
    'm44q6y3o': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
    },
    'ytk5ba6l': {
      'en': 'Enter the email',
      'es': 'Introduce el correo electrónico',
    },
    'hi2yymxk': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
    },
    '92rkz0wl': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Language
  {
    'pw9fhsfe': {
      'en': 'Language',
      'es': 'Idioma',
    },
    '54vikyjk': {
      'en': 'Search language',
      'es': 'Idioma de búsqueda',
    },
    '6x0nymve': {
      'en': 'English',
      'es': 'Inglés',
    },
    'lwrdsvca': {
      'en': 'Spanish',
      'es': 'Español',
    },
    '3sa48wmg': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // NotificationSetting
  {
    'pv5ygd8b': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'inr065ip': {
      'en': 'Payment',
      'es': 'Pago',
    },
    'ltse1dpj': {
      'en': 'Tracking',
      'es': 'Seguimiento',
    },
    'ma7hjc40': {
      'en': 'Complete Order',
      'es': 'Pedido completo',
    },
    'ohk8lp29': {
      'en': 'Notification',
      'es': 'Notificación',
    },
    'vmced3si': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // HelpandSupport
  {
    'pwzylnu2': {
      'en': 'Help and Support',
      'es': 'Ayuda y soporte',
    },
    'imqqsfz4': {
      'en': 'Contactar Soporte',
      'es': 'Contactar Soporte',
    },
    'f4y39b4e': {
      'en':
          'Need help? Our support team is available to assist you via WhatsApp.',
      'es':
          '¿Necesitas ayuda? Nuestro equipo de soporte está disponible para ayudarte por WhatsApp.',
    },
    '423hos2k': {
      'en': 'Office Hours',
      'es': 'Horario de oficina',
    },
    'l23mhqgh': {
      'en': 'Lunes a Viernes: 9:00 AM - 8:00 PM\nSábados: 10:00 AM - 8:00 PM',
      'es':
          'Lunes a Viernes: 9:00 a.m. - 8:00 p.m.\nSábados: 10:00 a.m. - 8:00 p.m.',
    },
    's4alqp7l': {
      'en': 'Número de Soporte',
      'es': 'Número de Soporte',
    },
    'bzkksv8g': {
      'en': '+52 55 1234 5678',
      'es': '+52 55 1234 5678',
    },
    'ivdrw9k1': {
      'en': 'Preguntas Frecuentes',
      'es': 'Preguntas frecuentes',
    },
    'jyz93dqk': {
      'en':
          '• Problemas de acceso a la cuenta\n• Consultas sobre facturación\n• Soporte técnico general\n• Información sobre productos',
      'es':
          '• Problemas de acceso a la cuenta\n• Consultas sobre facturación\n• Soporte técnico general\n• Información sobre productos',
    },
    'vxzqhxxf': {
      'en': 'Abrir WhatsApp',
      'es': 'Abrir WhatsApp',
    },
    'leiu5g56': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AdminCart
  {
    'dnlzpmpw': {
      'en': 'Carrito',
      'es': 'Carrito',
    },
    'xf0ionky': {
      'en': 'Artículos',
      'es': 'Artículos',
    },
    'dmca7vkc': {
      'en': 'Desglose',
      'es': 'Desglose',
    },
    'cefgw0gj': {
      'en': 'Total',
      'es': 'Total',
    },
    'bxiivonh': {
      'en': 'Grilled Chicken Breast',
      'es': 'Pechuga de pollo a la parrilla',
    },
    '5lortd3f': {
      'en': 'Herb-seasoned chicken with roasted vegetables',
      'es': 'Pollo sazonado con hierbas y verduras asadas',
    },
    'zqx1y4ln': {
      'en': '\$22.50',
      'es': '\$22.50',
    },
    'z5u7k8ie': {
      'en': '1',
      'es': '1',
    },
    'tazqi3mh': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
    },
    'ad1zxpdc': {
      'en': 'Crisp romaine lettuce with parmesan and croutons',
      'es': 'Lechuga romana crujiente con parmesano y crutones',
    },
    'r1i65fvn': {
      'en': '\$8.40',
      'es': '\$8.40',
    },
    'lmlvgw2y': {
      'en': '1',
      'es': '1',
    },
    'akg6tk5o': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'd3m4ihep': {
      'en': 'Impuesto\n (13%)',
      'es': 'Impuesto\n(13%)',
    },
    '8mn09ab7': {
      'en': 'Total',
      'es': 'Total',
    },
    'uah8j3au': {
      'en': 'Agregar plato',
      'es': 'Agregar plato',
    },
    'iirakjrx': {
      'en': 'Pagar',
      'es': 'Pagar',
    },
  },
  // Admin_MenuInicial
  {
    'n5qg7aej': {
      'en': 'Panel de Administración',
      'es': 'Panel de Administración',
    },
    'q1ltihhh': {
      'en': 'Gestiona tu sistema desde aquí',
      'es': 'Gestiona tu sistema desde aquí',
    },
    'tz1a3dad': {
      'en': 'Gestión de Usuarios',
      'es': 'Gestión de Usuarios',
    },
    '3ft5pwgb': {
      'en': 'Clientes y repartidores',
      'es': 'Clientes y repartidores',
    },
    'p35heul5': {
      'en': 'Gestión de Pedidos',
      'es': 'Gestión de Pedidos',
    },
    '1ei81e6f': {
      'en': 'Órdenes y entregas',
      'es': 'Órdenes y entregas',
    },
    'bfleebef': {
      'en': 'Inventario',
      'es': 'Inventario',
    },
    'jfr8ueup': {
      'en': 'Productos y stock',
      'es': 'Productos y existencias',
    },
    'mq4b42lw': {
      'en': 'Reportes',
      'es': 'Informes',
    },
    'xwc05bmh': {
      'en': 'Informacion y Exportacion',
      'es': 'Información y Exportación',
    },
    'i2zqollr': {
      'en': 'Catalogo',
      'es': 'Catálogo',
    },
    'c7q58132': {
      'en': 'Menu de platillos',
      'es': 'Menú de platillos',
    },
    'yn0k2to1': {
      'en': 'Gestion Productos',
      'es': 'Gestion Productos',
    },
    'cxbkrwxc': {
      'en': 'Agregar nuevos y eliminar',
      'es': 'Agregar nuevos y eliminar',
    },
    'qdpx0b17': {
      'en': 'Configuraciones del Sistema',
      'es': 'Configuraciones del Sistema',
    },
    'j1bunyyv': {
      'en': 'Ajustes generales y parámetros',
      'es': 'Ajustes generales y parámetros',
    },
    'z174l0bb': {
      'en': 'Sistema Activo',
      'es': 'Sistema Activo',
    },
    'qc138rcg': {
      'en': 'Todas las funciones operativas',
      'es': 'Todas las funciones operativas',
    },
  },
  // Admin_EliminarUsuario
  {
    '1a6aqbbd': {
      'en': 'Eliminar Usuario',
      'es': 'Eliminar usuario',
    },
    'h0sgdod0': {
      'en':
          '¿Estás seguro de que deseas eliminar este usuario? Esta acción no se puede deshacer.',
      'es':
          '¿Estás seguro de que deseas eliminar este usuario? Esta acción no se puede deshacer.',
    },
    'y4iyhgi7': {
      'en': 'Información del Usuario',
      'es': 'Información del usuario',
    },
    'uv3xgsw1': {
      'en': 'Nombre:',
      'es': 'Nombre:',
    },
    '7bv2t2q7': {
      'en': 'Email:',
      'es': 'Correo electrónico:',
    },
    '7r8uggeg': {
      'en': 'Teléfono:',
      'es': 'Teléfono:',
    },
    'wjk01nha': {
      'en': 'Rol:',
      'es': 'Rol:',
    },
    'i4zdhg6p': {
      'en': 'Fecha de Registro:',
      'es': 'Fecha de Registro:',
    },
    '8icr2uy6': {
      'en': 'Estado:',
      'es': 'Estado:',
    },
    'l8wqzlhe': {
      'en':
          'Al eliminar este usuario, se perderán todos sus datos asociados incluyendo historial de actividades y configuraciones personalizadas.',
      'es':
          'Al eliminar este usuario, se perderán todos sus datos asociados, incluido el historial de actividades y configuraciones personalizadas.',
    },
    '52o4ave9': {
      'en': 'Eliminar Usuario',
      'es': 'Eliminar usuario',
    },
    '7rvhdk5q': {
      'en': 'Cancelar',
      'es': 'Cancelar',
    },
    'dl63vyi1': {
      'en': 'Confirmar Eliminación',
      'es': 'Confirmar Eliminación',
    },
  },
  // Inventario
  {
    '72yc4bnl': {
      'en': 'Elección de producto',
      'es': 'Elección de producto',
    },
    '4owien4h': {
      'en': 'Seleccionar Producto',
      'es': 'Seleccionar Producto',
    },
    '7t6cnu2n': {
      'en': 'Buscar...',
      'es': 'Buscar...',
    },
    'nlai05gt': {
      'en': 'Opción 1',
      'es': 'Opción 1',
    },
    'fj5uoawy': {
      'en': 'Opción 2',
      'es': 'Opción 2',
    },
    'zdwbr9hy': {
      'en': 'Opción 3',
      'es': 'Opción 3',
    },
    'z6quy6co': {
      'en': 'Cantidad',
      'es': 'Cantidad',
    },
    '6k81pjcs': {
      'en': 'Elegir tipo de Registro',
      'es': 'Elegir tipo de Registro',
    },
    'jn0g7j5u': {
      'en': 'Ingreso a Inventario',
      'es': 'Ingreso a Inventario',
    },
    'qv7y2hbo': {
      'en': 'Selecciona...',
      'es': 'Selecciona...',
    },
    'w2gldcx6': {
      'en': 'Buscar...',
      'es': 'Buscar...',
    },
    '9mvem634': {
      'en': 'Ingreso a Inventario',
      'es': 'Ingreso a Inventario',
    },
    'guj7se2p': {
      'en': 'Salida de Inventario',
      'es': 'Salida de Inventario',
    },
    'gssl46wh': {
      'en': 'Guardar registro',
      'es': 'Guardar registro',
    },
    'rkqxol0v': {
      'en': 'Ver inventario',
      'es': 'Ver inventario',
    },
    '6w3s6ry6': {
      'en': 'CONTROL DE INVENTARIOS',
      'es': 'CONTROL DE INVENTARIOS',
    },
    '7zm7444c': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Admin_UsersRoles
  {
    '92m932pk': {
      'en': 'Panel Administrativo',
      'es': 'Panel Administrativo',
    },
    'de7768mf': {
      'en': 'Sistema de gestión',
      'es': 'Sistema de gestión',
    },
    '8icwky3e': {
      'en': 'Gestión de Usuarios',
      'es': 'Gestión de Usuarios',
    },
    'gb63f52t': {
      'en': 'Buscar y Filtrar Usuarios',
      'es': 'Buscar y filtrar usuarios',
    },
    'xvie065r': {
      'en': 'Buscar por nombre o correo...',
      'es': 'Buscar por nombre o correo...',
    },
    'h2071fne': {
      'en': 'Todos los roles',
      'es': 'Todos los roles',
    },
    'tjsgv0yt': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'jvrhllc7': {
      'en': 'Cliente',
      'es': 'Cliente',
    },
    '861dip1g': {
      'en': 'Repartidor',
      'es': 'Repartidor',
    },
    'rxpmuixx': {
      'en': 'Administrador',
      'es': 'Administrador',
    },
    'gkq08qdz': {
      'en': 'NOMBRE',
      'es': 'NOMBRE',
    },
    '6va1fsxk': {
      'en': 'CORREO',
      'es': 'CORREO',
    },
    'p9pi40nv': {
      'en': 'ROL',
      'es': 'ROL',
    },
    'p3rgr7ei': {
      'en': 'ACCIONES',
      'es': 'ACCIONES',
    },
    'cuqa5wzj': {
      'en': 'Regresar al Menú Principal',
      'es': 'Regresar al Menú Principal',
    },
  },
  // VerInventario
  {
    'jjd13poi': {
      'en': 'Inventario',
      'es': 'Inventario',
    },
    'w7m13ak6': {
      'en': 'Ver movimientos',
      'es': 'Ver movimientos',
    },
    't2ud8e9d': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AdminGestionPedidos
  {
    '2vbus3v9': {
      'en': 'Gestión de Pedidos',
      'es': 'Gestión de Pedidos',
    },
    'p77bxp6y': {
      'en': 'Administra y actualiza el estado de los pedidos',
      'es': 'Administra y actualiza el estado de los pedidos.',
    },
    'xhmdresj': {
      'en': 'Listado de Pedidos',
      'es': 'Listado de Pedidos',
    },
    '83f3y3l8': {
      'en': 'Lista de Productos:',
      'es': 'Lista de productos:',
    },
    'qh6x6tul': {
      'en': 'Actualizado el Estado:',
      'es': 'Actualizado el Estado:',
    },
    '2mxey13l': {
      'en': 'Recibido',
      'es': 'Recibido',
    },
    '0h5qla5w': {
      'en': 'Listo para Entrega',
      'es': 'Listo para Entrega',
    },
    'fcyuzzlp': {
      'en': 'En preparación',
      'es': 'En preparación',
    },
  },
  // Repartidor_MisEntregas
  {
    'evddkwlh': {
      'en': 'Mis Entregas',
      'es': 'Mis entregas',
    },
    'b4mxfv5f': {
      'en': 'Productos:',
      'es': 'Productos:',
    },
    '6eoitb4z': {
      'en': '• Camarones Empanizados x2',
      'es': '• Camarones Empanizados x2',
    },
    '8dt9f90c': {
      'en': '•Ceviche Tropical x1',
      'es': '•Ceviche Tropical x1',
    },
    'ey41d2wz': {
      'en': '• Cocktail de Camarón x1',
      'es': '• Cóctel de Camarón x1',
    },
    'abe5d7f7': {
      'en': 'En reparto',
      'es': 'En reparto',
    },
    'mveee8v6': {
      'en': 'Entregado',
      'es': 'Entregado',
    },
    '7lv6mn4f': {
      'en': 'Pendiente',
      'es': 'Pendiente',
    },
    't3mihdv3': {
      'en': 'Pedido #12346',
      'es': 'Pedido #12346',
    },
    '334yjxs1': {
      'en': 'En Camino',
      'es': 'En Camino',
    },
    'n3vl5rcc': {
      'en': 'Carlos Rodríguez',
      'es': 'Carlos Rodríguez',
    },
    '4s0spit9': {
      'en': 'Calle San Martín 567, Casa 12',
      'es': 'Calle San Martín 567, Casa 12',
    },
    't5u6rsfu': {
      'en': '+54 11 9876-5432',
      'es': '+54 11 9876-5432',
    },
    'x83dxmfj': {
      'en': 'Horario: 19:00 - 21:00',
      'es': 'Horario: 19:00 - 21:00',
    },
    'dxxttg5x': {
      'en': 'Productos:',
      'es': 'Productos:',
    },
    'mbwu4dq1': {
      'en': '• Hamburguesa Completa x1',
      'es': '• Hamburguesa Completa x1',
    },
    '8v16iikj': {
      'en': '• Papas Fritas x1',
      'es': '• Papas fritas x1',
    },
    'tkmzsx2d': {
      'en': '• Sprite 500ml x1',
      'es': '• Sprite 500 ml x1',
    },
    '5ke877z5': {
      'en': 'Total: \$1,850',
      'es': 'Total: \$1,850',
    },
    'rnhbskix': {
      'en': 'Tarjeta',
      'es': 'Tarjeta',
    },
    'cx2qz3zr': {
      'en': 'Llamar',
      'es': 'Llamar',
    },
    '7hl0sk1l': {
      'en': 'Entregado',
      'es': 'Entregado',
    },
    'ipmxvnln': {
      'en': 'Pedido #12347',
      'es': 'Pedido #12347',
    },
    'uhe9uhbt': {
      'en': 'Entregado',
      'es': 'Entregado',
    },
    'pmnjh649': {
      'en': 'Ana Martínez',
      'es': 'Ana Martínez',
    },
    'vpl4jums': {
      'en': 'Av. Corrientes 890, Oficina 301',
      'es': 'AV. Corrientes 890, Oficina 301',
    },
    'j3wfp6jx': {
      'en': 'Entregado a las 13:45',
      'es': 'Entregado a las 13:45',
    },
    'qvns8mh5': {
      'en': 'Productos:',
      'es': 'Productos:',
    },
    'xq7ggfxo': {
      'en': '• Sushi Variado x20 piezas',
      'es': '• Sushi Variado x20 piezas',
    },
    '8zjx5qik': {
      'en': '• Salsa de soja x2',
      'es': '• Salsa de soja x2',
    },
    'hyhgenpv': {
      'en': 'Total: \$3,200',
      'es': 'Total: \$3,200',
    },
    'zyvq3cw7': {
      'en': 'Efectivo',
      'es': 'Efectivo',
    },
    'frcurrc4': {
      'en': 'Pedido completado exitosamente',
      'es': 'Pedido completado exitosamente',
    },
  },
  // ResumenOrdenUser
  {
    'xbpnloy3': {
      'en': 'Order Confirmed',
      'es': 'Pedido confirmado',
    },
    'pgpf3904': {
      'en': 'Your order has been placed successfully!',
      'es': '¡Su pedido se ha realizado exitosamente!',
    },
    'dt7a3sj1': {
      'en': 'Order Details',
      'es': 'Detalles del pedido',
    },
    '2devum9o': {
      'en': 'Order Number:',
      'es': 'Número de orden:',
    },
    'ythz3wwi': {
      'en': 'Order Date:',
      'es': 'Fecha del pedido:',
    },
    '138pjtju': {
      'en': 'Delivery Information',
      'es': 'Información de entrega',
    },
    'lm9te84j': {
      'en': 'Payment Method:',
      'es': 'Método de pago:',
    },
    'rycj59gk': {
      'en': 'Delivery Address:',
      'es': 'Dirección de entrega:',
    },
    'u5f73mkg': {
      'en': 'Order Items',
      'es': 'Artículos del pedido',
    },
    'rewqa3k1': {
      'en': 'Order Summary',
      'es': 'Resumen del pedido',
    },
    '8czydbpx': {
      'en': 'Discount Applied:',
      'es': 'Descuento aplicado:',
    },
    's01sgsgc': {
      'en': '-₡0',
      'es': '-₡0',
    },
    'btnv7y2l': {
      'en': 'Tax (13%):',
      'es': 'Impuesto (13%):',
    },
    'g6sws51b': {
      'en': 'Delivery Fee:',
      'es': 'Tarifa de envío:',
    },
    'hf24pora': {
      'en': '₡800',
      'es': '₡800',
    },
    'd5pd69b4': {
      'en': 'Grand Total:',
      'es': 'Gran total:',
    },
    'dvqcf9uv': {
      'en': 'View My Orders',
      'es': 'Ver mis pedidos',
    },
    '7ohjuyiq': {
      'en': 'Back to Home',
      'es': 'Volver a Inicio',
    },
  },
  // VerMovInventario
  {
    'qr4g392e': {
      'en': 'Movimientos',
      'es': 'Movimientos',
    },
    '3uyhnewk': {
      'en': 'Regresar',
      'es': 'Regresar',
    },
    '2oqrrciq': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // VerFacturas
  {
    'g3mxwyyv': {
      'en': 'Historial de Facturas',
      'es': 'Historial de Facturas',
    },
    'p548sste': {
      'en': 'Regresar',
      'es': 'Regresar',
    },
    'ca072msv': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Menu_repartidor
  {
    'yoqqvm3j': {
      'en': 'Panel del Repartidor',
      'es': 'Panel del Repartidor',
    },
    'qi16k5ja': {
      'en': 'Gestiona tus entregas de manera eficiente',
      'es': 'Gestiona tus entregas de manera eficiente',
    },
    'dqx2zb0n': {
      'en': 'Mi Perfil',
      'es': 'Mi perfil',
    },
    'ep4vmwte': {
      'en': 'Información personal',
      'es': 'Información personal',
    },
    'lzx40dkm': {
      'en': 'Historial de Pedidos',
      'es': 'Historial de Pedidos',
    },
    'etvljxqz': {
      'en': 'Entregas realizadas',
      'es': 'Entregas realizadas',
    },
    'y76i214w': {
      'en': 'Pedidos Pendientes',
      'es': 'Pedidos Pendientes',
    },
    'rpz6irj1': {
      'en': 'Mis Entregas',
      'es': 'Mis entregas',
    },
    'h31pzg5m': {
      'en': 'Estado: Disponible',
      'es': 'Estado: Disponible',
    },
    '2utpn86k': {
      'en': 'Listo para recibir nuevos pedidos',
      'es': 'Listo para recibir nuevos pedidos',
    },
    'ud4f6lk4': {
      'en': 'Hola, Carlos',
      'es': 'Hola, Carlos',
    },
    'fiom6ovv': {
      'en': 'Repartidor activo',
      'es': 'Repartidor activo',
    },
  },
  // ConfirmaPagoAdmin
  {
    'cmhrpshr': {
      'en': 'Medio de pago',
      'es': 'Medio de pago',
    },
    'p1pnv10u': {
      'en': 'Artículos en tu carrito',
      'es': 'Artículos en tu carrito',
    },
    '6gdz5b26': {
      'en': 'Método de pago',
      'es': 'Método de pago',
    },
    '25zkvkc9': {
      'en': 'Efectivo',
      'es': 'Efectivo',
    },
    'prtt6v0h': {
      'en': 'Efectivo',
      'es': 'Efectivo',
    },
    '0qnknev9': {
      'en': 'Sinpe Móvil',
      'es': 'Sinpe Móvil',
    },
    'p9e8hj8b': {
      'en': 'Código de descuento',
      'es': 'Código de descuento',
    },
    'wln7eto2': {
      'en': 'Ingresa el Valor',
      'es': 'Ingresa el Valor',
    },
    'mdvirb4g': {
      'en': '0.0',
      'es': '0.0',
    },
    'wxzcf8bm': {
      'en': 'Aplicar',
      'es': 'Aplicar',
    },
    'tihvdzmt': {
      'en': 'Resumen de orden',
      'es': 'Resumen de orden',
    },
    '680qc5xo': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'qxt7hg9l': {
      'en': 'Impuesto (13%)',
      'es': 'Impuesto (13%)',
    },
    'j1xu9vax': {
      'en': 'Total',
      'es': 'Total',
    },
    'y96cjr76': {
      'en': 'Volver al Carrito',
      'es': 'Volver al Carrito',
    },
    '94bnhzgo': {
      'en': 'Confirmar Orden',
      'es': 'Confirmar orden',
    },
  },
  // ConfirmaPagoUser
  {
    '44t7jk1j': {
      'en': 'Confirmacion de Pedido',
      'es': 'Confirmacion de Pedido',
    },
    'tttr81eq': {
      'en': 'Artículos en tu carrito:',
      'es': 'Artículos en tu carrito:',
    },
    '2ooid5en': {
      'en': 'Método de pago',
      'es': 'Método de pago',
    },
    'ebi37apt': {
      'en': '',
      'es': '',
    },
    'jz4dw8xz': {
      'en': 'Resumen de orden',
      'es': 'Resumen de orden',
    },
    'hbnztxtc': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'nbzlr15d': {
      'en': 'Impuesto (13%)',
      'es': 'Impuesto (13%)',
    },
    'iex6nyxp': {
      'en': 'Total',
      'es': 'Total',
    },
    'ib41ry7h': {
      'en': 'Volver al Carrito',
      'es': 'Volver al Carrito',
    },
    '51znp1hk': {
      'en': 'Confirmar Orden',
      'es': 'Confirmar orden',
    },
  },
  // UserCartOficial
  {
    'ekaync68': {
      'en': 'Carrito',
      'es': 'Carrito',
    },
    '87z5es48': {
      'en': 'Artículos',
      'es': 'Artículos',
    },
    '6u8et6ui': {
      'en': 'Total a Pagar:',
      'es': 'Total a Pagar:',
    },
    'd6ilgx5l': {
      'en': 'Total',
      'es': 'Total',
    },
    'obtc04xw': {
      'en': 'Grilled Chicken Breast',
      'es': 'Pechuga de pollo a la parrilla',
    },
    'ro32szuz': {
      'en': 'Herb-seasoned chicken with roasted vegetables',
      'es': 'Pollo sazonado con hierbas y verduras asadas',
    },
    '1a4ng7ob': {
      'en': '\$22.50',
      'es': '\$22.50',
    },
    'tpbi8xz4': {
      'en': '1',
      'es': '1',
    },
    'rxemm5pz': {
      'en': 'Caesar Salad',
      'es': 'Ensalada Cesar',
    },
    'mqu9bej3': {
      'en': 'Crisp romaine lettuce with parmesan and croutons',
      'es': 'Lechuga romana crujiente con parmesano y crutones',
    },
    '57fakz35': {
      'en': '\$8.40',
      'es': '\$8.40',
    },
    'gxrcd9gs': {
      'en': '1',
      'es': '1',
    },
    'fkybmaf2': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'c02k5f0c': {
      'en': 'Impuesto\n (13%)',
      'es': 'Impuesto\n(13%)',
    },
    '8f740sn1': {
      'en': 'Total',
      'es': 'Total',
    },
    '6t0ym9ll': {
      'en': 'Agregar más productos',
      'es': 'Agregar más productos',
    },
    'ch3rxlr1': {
      'en': 'Proceder al pago',
      'es': 'Proceder al pago',
    },
  },
  // InventarioReporteria
  {
    'w7rxr3zt': {
      'en': 'INVENTARIO',
      'es': 'INVENTARIO',
    },
    'qcvrx2fg': {
      'en': 'CATEGORIA',
      'es': 'CATEGORÍA',
    },
    'yvkr7nrz': {
      'en': 'INVENTARIO',
      'es': 'INVENTARIO',
    },
    'v0z4w2z9': {
      'en': 'CIERRES',
      'es': 'CIERRES',
    },
    'll54tlqi': {
      'en': 'AUDITORIAS',
      'es': 'AUDITORÍAS',
    },
    'ufurcnvu': {
      'en': 'Volver',
      'es': 'Volver',
    },
    'jc178evu': {
      'en': 'SELECCION DE FECHA',
      'es': 'SELECCIÓN DE FECHA',
    },
    'f05zl743': {
      'en': 'Fecha Inicial',
      'es': 'Fecha Inicial',
    },
    'c9afxb8o': {
      'en': 'Fecha Final',
      'es': 'Fecha final',
    },
    'o64bsdqt': {
      'en': 'Elementos: ',
      'es': 'Elementos:',
    },
    'c78skz3m': {
      'en': 'Detalles',
      'es': 'Detalles',
    },
    'mw5gw113': {
      'en': 'Fecha',
      'es': 'Fecha',
    },
    'rdqc2wx4': {
      'en': 'Producto',
      'es': 'Producto',
    },
    '8gaanpk4': {
      'en': 'Accion',
      'es': 'Acción',
    },
    '4pckbqi3': {
      'en': 'Cantidades',
      'es': 'Cantidades',
    },
    's29itw1z': {
      'en': 'Antes',
      'es': 'Antes',
    },
    '9yjfr1rg': {
      'en': 'Ahora',
      'es': 'Ahora',
    },
    '6fb7z196': {
      'en': 'Stock Minimo',
      'es': 'Stock mínimo',
    },
    'g5ditmrl': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CierresReporteria
  {
    'erjvx36m': {
      'en': 'CIERRES',
      'es': 'CIERRES',
    },
    'o6gpf4ct': {
      'en': 'CATEGORIA',
      'es': 'CATEGORÍA',
    },
    'br7tekne': {
      'en': 'INVENTARIO',
      'es': 'INVENTARIO',
    },
    'yrr1bgs1': {
      'en': 'CIERRES',
      'es': 'CIERRES',
    },
    'q0shpqzm': {
      'en': 'AUDITORIAS',
      'es': 'AUDITORÍAS',
    },
    'yf24lmq0': {
      'en': 'Volver',
      'es': 'Volver',
    },
    '2ncqjmxx': {
      'en': 'SELECCION DE FECHA',
      'es': 'SELECCIÓN DE FECHA',
    },
    '87vsneuc': {
      'en': 'Fecha Inicial',
      'es': 'Fecha Inicial',
    },
    'slo8y5p8': {
      'en': 'Fecha Final',
      'es': 'Fecha final',
    },
    'mhvfu76m': {
      'en': 'Elementos: ',
      'es': 'Elementos:',
    },
    'ycw62ri5': {
      'en': 'Detalles',
      'es': 'Detalles',
    },
    'h6639rrp': {
      'en': 'Fecha',
      'es': 'Fecha',
    },
    'ug6ncxvc': {
      'en': 'Producto',
      'es': 'Producto',
    },
    '2be7q4s6': {
      'en': 'Metodo de Pago',
      'es': 'Método de pago',
    },
    'ez92ccp6': {
      'en': 'Cantidades',
      'es': 'Cantidades',
    },
    'ky3r9erd': {
      'en': 'Descuento',
      'es': 'Descuento',
    },
    'dm4sv27b': {
      'en': 'Total',
      'es': 'Total',
    },
    'oevpuwa9': {
      'en': 'TOTAL FECHAS SELECCIONADAS:',
      'es': 'TOTAL FECHAS SELECCIONADAS:',
    },
    'dpqm92uc': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ResumenOrdenAdmin
  {
    '9et7qh1l': {
      'en': '¡Orden confirmada!',
      'es': '¡Pedido confirmado!',
    },
    'qgoh3mzh': {
      'en': '¡Orden registrada correctamente!',
      'es': '¡Orden registrado correctamente!',
    },
    's2sdsuiy': {
      'en': 'Detalles de la orden',
      'es': 'Detalles de la orden',
    },
    'zrkr5moz': {
      'en': 'Número de orden:',
      'es': 'Número de orden:',
    },
    'd4xu6tal': {
      'en': 'Fecha de orden:',
      'es': 'Fecha de orden:',
    },
    '4n5wsf4r': {
      'en': 'Información de envío',
      'es': 'Información de envío',
    },
    'h61qppx6': {
      'en': 'Método de pago:',
      'es': 'Método de pago:',
    },
    'p8qbohzi': {
      'en': 'Dirección de envío:',
      'es': 'Dirección de envío:',
    },
    '6tpulho2': {
      'en': 'Lista de pedido',
      'es': 'Lista de pedido',
    },
    'wwl5yspk': {
      'en': 'Crispy Chicken Wings',
      'es': 'Alitas de pollo crujientes',
    },
    'k0gjumbu': {
      'en': 'x1',
      'es': 'x1',
    },
    'un74b43p': {
      'en': '₡3,200',
      'es': '₡3,200',
    },
    '8t1hxbzu': {
      'en': 'Fresh Garden Salad',
      'es': 'Ensalada fresca de la huerta',
    },
    'n95xikub': {
      'en': 'x1',
      'es': 'x1',
    },
    'l9jqwdlx': {
      'en': '₡2,800',
      'es': '₡2,800',
    },
    '3xpldkjp': {
      'en': 'Order Summary',
      'es': 'Resumen del pedido',
    },
    'kfwa8t8o': {
      'en': 'Discount Applied:',
      'es': 'Descuento aplicado:',
    },
    'zkkng5jp': {
      'en': 'Tax (13%):',
      'es': 'Impuesto (13%):',
    },
    '3ha8fsys': {
      'en': 'Grand Total:',
      'es': 'Gran total:',
    },
    '9nhx036g': {
      'en': 'Ver mis órdenes',
      'es': 'Ver mis órdenes',
    },
    '3gp2c6wb': {
      'en': 'Regresar a Catálogo',
      'es': 'Regresar a Catálogo',
    },
  },
  // HomeScreenUser
  {
    'lfdko049': {
      'en': 'Location',
      'es': 'Ubicación',
    },
    'y3aqkdjm': {
      'en': 'Hola!',
      'es': 'Hola!',
    },
    'qulnf2cw': {
      'en':
          'Bienvenidos a la Cevichera, disfruta de nuestros mejores platillos\nA un solo paso! ',
      'es':
          'Bienvenidos a la Cevichera, disfruta de nuestros mejores platillos.\n¡Un paso en solitario!',
    },
    'h9l22ou2': {
      'en': 'Buscar Platillo',
      'es': 'Buscar Platillo',
    },
    '5rk7r9wh': {
      'en': 'Todos',
      'es': 'Todos',
    },
    '1841eb1u': {
      'en': 'Categoria',
      'es': 'Categoría',
    },
    'g1jpr8cy': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'zm3qem82': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'vc7llgai': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    'n7e7t5hv': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    '4yzvo522': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    'p4ry92zs': {
      'en': 'Resultados:   ',
      'es': 'Resultados:',
    },
    '05sndz3s': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // DetailUserOfi
  {
    'x8nler7r': {
      'en': 'Menu Detail',
      'es': 'Detalle del menú',
    },
    'rfeie538': {
      'en': 'Descripción',
      'es': 'Descripción',
    },
    'iabkqyzp': {
      'en': 'Locación',
      'es': 'Ubicación',
    },
    '3qc2u9aq': {
      'en': 'Añadir al Carrito',
      'es': 'Añadir al Carrito',
    },
    '53vx9zgc': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SettingAdmin
  {
    'mgslxl9i': {
      'en': 'Setting',
      'es': 'Configuración',
    },
    'v2kkz56u': {
      'en': 'General',
      'es': 'General',
    },
    'krhwimz7': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'e257wb1d': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
    },
    '8hm1cw6t': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    '3615bno6': {
      'en': 'Notification Setting',
      'es': 'Configuración de notificaciones',
    },
    'awkor111': {
      'en': 'Language',
      'es': 'Idioma',
    },
    '22fb38e6': {
      'en': 'Preferencess',
      'es': 'Preferencias',
    },
    'zkpk3xdt': {
      'en': 'Legal and Policies',
      'es': 'Legal y políticas',
    },
    'f87wubt1': {
      'en': 'Help & Support',
      'es': 'Ayuda y soporte',
    },
    'exmg4o56': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    '1jhudmh0': {
      'en': 'Foodcort Version 1.0.12 Build 24',
      'es': 'Foodcort Versión 1.0.12 Build 24',
    },
    'srwhb01q': {
      'en': 'Setting',
      'es': 'Configuración',
    },
  },
  // HistoPedidosCatalogoAdmin
  {
    '28w2wnp3': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
    },
    'fvmknlqa': {
      'en': 'My Order',
      'es': 'Mi pedido',
    },
    '8xviiqfu': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    '1z9in1ze': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'xc0j4m1c': {
      'en': 'Price',
      'es': 'Precio',
    },
    '9lkfld8e': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'j9dpoe74': {
      'en': 'History',
      'es': 'Historia',
    },
    'up2zv2mu': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    '344hw0sm': {
      'en': 'Date',
      'es': 'Fecha',
    },
    '4y3uenfv': {
      'en': 'Price',
      'es': 'Precio',
    },
    'weuz2i0a': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'tj2r75ml': {
      'en': 'Tracking',
      'es': 'Seguimiento',
    },
    'r3my2l7j': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
    },
  },
  // AuditoriasReporteria
  {
    'o7hlaxnj': {
      'en': 'AUDITORIAS',
      'es': 'AUDITORÍAS',
    },
    'kaak8vn9': {
      'en': 'CATEGORIA',
      'es': 'CATEGORÍA',
    },
    'g8nu3msa': {
      'en': 'INVENTARIO',
      'es': 'INVENTARIO',
    },
    'ixi2rsbt': {
      'en': 'CIERRES',
      'es': 'CIERRES',
    },
    'n9uhu4pu': {
      'en': 'AUDITORIAS',
      'es': 'AUDITORÍAS',
    },
    '48en1ytj': {
      'en': 'Volver',
      'es': 'Volver',
    },
    'x77na4ox': {
      'en': 'SELECCION DE FECHA',
      'es': 'SELECCIÓN DE FECHA',
    },
    '84bn3fyi': {
      'en': 'Fecha Inicial',
      'es': 'Fecha Inicial',
    },
    'j06t94x1': {
      'en': 'Fecha Final',
      'es': 'Fecha Final',
    },
    '29md96s3': {
      'en': 'Elementos: ',
      'es': 'Elementos:',
    },
    'x88bvxus': {
      'en': '',
      'es': '',
    },
    'xq297yli': {
      'en': 'Seleccionar Tabla',
      'es': 'Seleccionar Tabla',
    },
    'o2a2513q': {
      'en': '',
      'es': '',
    },
    '2n6ue5la': {
      'en': 'PRODUCTO',
      'es': 'PRODUCTO',
    },
    '9me7pfaq': {
      'en': 'INVENTARIO',
      'es': 'INVENTARIO',
    },
    'ninhs4rt': {
      'en': 'USUARIO',
      'es': 'USUARIO',
    },
    '2wac7e30': {
      'en': '',
      'es': '',
    },
    'qrel3zcd': {
      'en': 'Seleccionar Acción',
      'es': 'Seleccionar Acción',
    },
    'ib6roywq': {
      'en': 'Buscar...',
      'es': 'Buscar...',
    },
    'aui0axes': {
      'en': 'CREATE',
      'es': 'CREATE',
    },
    '2n0bt0g8': {
      'en': 'UPDATE',
      'es': 'UPDATE',
    },
    'aqc80nl2': {
      'en': 'DELETE',
      'es': 'DELETE',
    },
    '7gptghhs': {
      'en': 'Detalles',
      'es': 'Detalles',
    },
    'nba4eqr2': {
      'en': 'Fecha',
      'es': 'Fecha',
    },
    'rhcqd8h7': {
      'en': 'Registro',
      'es': 'Registro',
    },
    'x2h8pt7d': {
      'en': 'Responsable',
      'es': 'Responsable',
    },
    'scjfc0fa': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // AgregarProductos2
  {
    '68umqx1l': {
      'en': 'NOTIFICACION',
      'es': 'NOTIFICACIÓN',
    },
    '16w0ch7u': {
      'en': 'El producto se ha creado exitosamente!',
      'es': '¡El producto se ha creado exitosamente!',
    },
    '4jo81ra7': {
      'en': 'VOLVER',
      'es': 'VOLVER',
    },
    'ukoik615': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditarProductos2
  {
    '76t4rw7n': {
      'en': 'Editar Producto',
      'es': 'Editar Producto',
    },
    '6l5hvf96': {
      'en': 'Nombre del Producto',
      'es': 'Nombre del Producto',
    },
    '21amlkhk': {
      'en': 'Descripcion',
      'es': 'Descripción',
    },
    'm1wlwcb8': {
      'en': 'Seleccione una categoría',
      'es': 'Seleccione una categoría',
    },
    'hug25xsa': {
      'en': 'Buscar categoría...',
      'es': 'Buscar categoría...',
    },
    'bjl51oia': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    '7mpz0hxs': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    'zy4xnos4': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    '9zqaoxx8': {
      'en': 'Precio',
      'es': 'Precio',
    },
    'n7q5a6ms': {
      'en': 'Activo',
      'es': 'Activo',
    },
    'cvnei46h': {
      'en': 'EDITAR',
      'es': 'EDITAR',
    },
  },
  // HomeScreenAdmin
  {
    '9h3829ww': {
      'en': 'Hola!',
      'es': 'Hola!',
    },
    '881ckk6q': {
      'en':
          'Bienvenidos a la Cevichera, disfruta de nuestros mejores platillos\nA un solo paso! ',
      'es':
          'Bienvenidos a la Cevichera, disfruta de nuestros mejores platillos.\n¡Un paso en solitario!',
    },
    'm36le80f': {
      'en': 'Buscar Platillo',
      'es': 'Buscar Platillo',
    },
    'ocjwirku': {
      'en': 'Todos',
      'es': 'Todos',
    },
    '7uxp1von': {
      'en': 'Categoria',
      'es': 'Categoría',
    },
    '5zik7way': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'lft8yjqh': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'dhlvk72c': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    '8d8nbzrv': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    '9ry3dydg': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    'w0epmkyo': {
      'en': 'Resultados:   ',
      'es': 'Resultados:',
    },
    'lk7rdi99': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditarProductos1
  {
    'm8qursoc': {
      'en': 'Editar Producto',
      'es': 'Editar Producto',
    },
    'z728o7os': {
      'en': 'SELECCION DE\nPRODUCTO',
      'es': 'SELECCIÓN DE PRODUCTO',
    },
    'l4ss0cif': {
      'en': 'Buscar Platillo',
      'es': 'Buscar Platillo',
    },
    'o4ao0gsa': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'nr44zg1q': {
      'en': 'Categoria',
      'es': 'Categoría',
    },
    'fp2gdsm8': {
      'en': 'Buscar...',
      'es': 'Buscar...',
    },
    'v6a8dxsx': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'vf8u6qeb': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    'wq5mzls7': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    'vaj9hwqk': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    '28eggbwv': {
      'en': 'Resultados:   ',
      'es': 'Resultados:',
    },
    'lu3vg80y': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditarProductos3
  {
    '9q07at6g': {
      'en': 'NOTIFICACION',
      'es': 'NOTIFICACIÓN',
    },
    '72lawq54': {
      'en': 'El producto se ha editado exitosamente!',
      'es': '¡El producto se ha editado exitosamente!',
    },
    'u2ywol5d': {
      'en': 'VOLVER',
      'es': 'VOLVER',
    },
    '6o7bzpvs': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EliminarProductos1
  {
    'oorlbbok': {
      'en': 'Desactivar Producto',
      'es': 'Desactivar Producto',
    },
    'mmho6n6f': {
      'en': 'SELECCION DE\nPRODUCTO',
      'es': 'SELECCIÓN DE PRODUCTO',
    },
    'qlf56puc': {
      'en': 'Buscar Platillo',
      'es': 'Buscar Platillo',
    },
    'y80h63x2': {
      'en': 'Todos',
      'es': 'Todos',
    },
    '4a1f1t6j': {
      'en': 'Categoria',
      'es': 'Categoría',
    },
    'mvk9hm3t': {
      'en': 'Buscar...',
      'es': 'Buscar...',
    },
    'hegkpf7b': {
      'en': 'Todos',
      'es': 'Todos',
    },
    'dj6fipl7': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    'rcd2ktoq': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    'p32jxh0a': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    'tzfk2wxu': {
      'en': 'Resultados:   ',
      'es': 'Resultados:',
    },
    '8f0bmh75': {
      'en': 'Desactivar',
      'es': 'Desactivar',
    },
    'k8qhzom4': {
      'en': 'Desactivar',
      'es': 'Desactivar',
    },
    'd1cwjz2k': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EliminarProductos2
  {
    'q7c7znjs': {
      'en': 'NOTIFICACION',
      'es': 'NOTIFICACIÓN',
    },
    'dfw4d6fc': {
      'en': 'El producto se ha eliminado exitosamente!',
      'es': '¡El producto se ha eliminado exitosamente!',
    },
    'ia780ath': {
      'en': 'VOLVER',
      'es': 'VOLVER',
    },
    'jgetmcx7': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Historial_pedidosAdmin
  {
    'vphebx7q': {
      'en': 'Historial de Pedidos',
      'es': 'Historial de Pedidos',
    },
    '1pelrinm': {
      'en': 'Revisa el estado de tus entregas',
      'es': 'Revisa el estado de tus entregas',
    },
    'e0xe4jq3': {
      'en': 'Entregas Completadas',
      'es': 'Entregas Completadas',
    },
    'tltw84w6': {
      'en': 'Pedido #ORD-2023-999',
      'es': 'Pedido #ORD-2023-999',
    },
    '845oovl4': {
      'en': 'Sushi Roll x2, Té Verde x1',
      'es': 'Rollo de sushi x2, Té verde x1',
    },
    'ejvxmoy4': {
      'en': 'Entregado: 13 Ene 2024, 13:20',
      'es': 'Entregado: 13 Ene 2024, 13:20',
    },
    'hkqu3mya': {
      'en': 'Entregado',
      'es': 'Entregado',
    },
    'nn4vi34m': {
      'en': 'Calificación: ⭐⭐⭐⭐',
      'es': 'Calificación: ⭐⭐⭐⭐',
    },
    '98uxr2ul': {
      'en': '\$52.30',
      'es': '\$52.30',
    },
    'z8903756': {
      'en': 'Pedido #ORD-2023-998',
      'es': 'Pedido #ORD-2023-998',
    },
    'kiscu8uq': {
      'en': 'Ensalada César x1, Agua Natural x1',
      'es': 'Ensalada César x1, Agua Natural x1',
    },
    '8676qckw': {
      'en': 'Entregado: 12 Ene 2024, 12:10',
      'es': 'Entregado: 12 Ene 2024, 12:10',
    },
    'vihx4l16': {
      'en': 'Entregado',
      'es': 'Entregado',
    },
    '7huev53x': {
      'en': 'Calificación: ⭐⭐⭐⭐⭐',
      'es': 'Calificación: ⭐⭐⭐⭐⭐',
    },
    'ep76zwfy': {
      'en': '\$18.90',
      'es': '\$18.90',
    },
    'dp998qav': {
      'en': 'Mis Pedidos',
      'es': 'Mis pedidos',
    },
  },
  // PerfilUser
  {
    'i5xbeac6': {
      'en': 'Editar Perfil',
      'es': 'Editar perfil',
    },
    'lm8s7rz8': {
      'en': 'Nombre completo',
      'es': 'Nombre completo',
    },
    '9g5vya5y': {
      'en': '',
      'es': '',
    },
    '0dueqcv9': {
      'en': 'Ingresa tu nombre completo',
      'es': 'Ingresa tu nombre completo',
    },
    'gwrj4ino': {
      'en': 'Correo electrónico',
      'es': 'Correo electrónico',
    },
    't3gyd8pe': {
      'en': 'ejemplo@correo.com',
      'es': 'ejemplo@correo.com',
    },
    '55gr3ps7': {
      'en': 'Teléfono',
      'es': 'Teléfono',
    },
    'xpl2dik5': {
      'en': '+1 (555) 123-4567',
      'es': '+1 (555) 123-4567',
    },
    'oph65llg': {
      'en': 'Dirección',
      'es': 'Dirección',
    },
    'sshwehet': {
      'en': 'Calle, número, ciudad',
      'es': 'Calle, número, ciudad',
    },
    'gcfysvju': {
      'en': 'Ubicación',
      'es': 'Ubicación',
    },
    'if4m2p0e': {
      'en': 'Cambiar Ubicacion',
      'es': 'Cambiar ubicación',
    },
    'vaye3shh': {
      'en': 'Cambiar contraseña',
      'es': 'Cambiar contraseña',
    },
    'nua8rlht': {
      'en': 'Guardar cambios',
      'es': 'Guarda cambios',
    },
  },
  // PerfilRepartidor
  {
    'gunpptyz': {
      'en': 'Editar Perfil',
      'es': 'Editar perfil',
    },
    'kuwcr4iy': {
      'en': 'Nombre completo',
      'es': 'Nombre completo',
    },
    'tbgvb2qj': {
      'en': '',
      'es': '',
    },
    'za9c2dyz': {
      'en': 'Ingresa tu nombre completo',
      'es': 'Ingresa tu nombre completo',
    },
    'vp4r3wsr': {
      'en': 'Correo electrónico',
      'es': 'Correo electrónico',
    },
    'rna275vl': {
      'en': 'ejemplo@correo.com',
      'es': 'ejemplo@correo.com',
    },
    '6cfd07nf': {
      'en': 'Teléfono',
      'es': 'Teléfono',
    },
    'sgea4rwe': {
      'en': '+1 (555) 123-4567',
      'es': '+1 (555) 123-4567',
    },
    'ztn0qzm4': {
      'en': 'Dirección',
      'es': 'Dirección',
    },
    '6hw26b4h': {
      'en': 'Calle, número, ciudad',
      'es': 'Calle, número, ciudad',
    },
    'ro0fnnmy': {
      'en': 'Ubicación',
      'es': 'Ubicación',
    },
    'fheqgmqz': {
      'en': 'Cambiar Ubicacion',
      'es': 'Cambiar ubicación',
    },
    'gz5093sn': {
      'en': 'Cambiar contraseña',
      'es': 'Cambiar contraseña',
    },
    'exisjdgb': {
      'en': 'Guardar cambios',
      'es': 'Guarda cambios',
    },
  },
  // PerfilAdmin
  {
    'ifeyvvvu': {
      'en': 'Editar Perfil',
      'es': 'Editar perfil',
    },
    'dbho1uk1': {
      'en': 'Nombre completo',
      'es': 'Nombre completo',
    },
    'jto0803w': {
      'en': '',
      'es': '',
    },
    'g9v0rhfm': {
      'en': 'Ingresa tu nombre completo',
      'es': 'Ingresa tu nombre completo',
    },
    'he75sdcn': {
      'en': 'Correo electrónico',
      'es': 'Correo electrónico',
    },
    'lyogsio4': {
      'en': 'ejemplo@correo.com',
      'es': 'ejemplo@correo.com',
    },
    'u4tguy3s': {
      'en': 'Teléfono',
      'es': 'Teléfono',
    },
    '3lkqr88f': {
      'en': '+1 (555) 123-4567',
      'es': '+1 (555) 123-4567',
    },
    'szobt249': {
      'en': 'Dirección',
      'es': 'Dirección',
    },
    'sqsxflae': {
      'en': 'Calle, número, ciudad',
      'es': 'Calle, número, ciudad',
    },
    'np5ujs2v': {
      'en': 'Ubicación',
      'es': 'Ubicación',
    },
    '13oer8ry': {
      'en': 'Cambiar Ubicacion',
      'es': 'Cambiar ubicación',
    },
    'x8h2cpu4': {
      'en': 'Cambiar contraseña',
      'es': 'Cambiar contraseña',
    },
    'gsp3pojl': {
      'en': 'Guardar cambios',
      'es': 'Guarda cambios',
    },
  },
  // HistorialPedidosCopy
  {
    'ldbmk8td': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
    },
    'y2567ilu': {
      'en': 'My Order',
      'es': 'Mi pedido',
    },
    'z18vkve1': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    'gxb2x8zt': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'f6jkzdfv': {
      'en': 'Price',
      'es': 'Precio',
    },
    'dk6eilfe': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'hutw57a7': {
      'en': 'History',
      'es': 'Historia',
    },
    'ododxty1': {
      'en': 'Cevichera Doña Cecilia',
      'es': 'Cevichera Doña Cecilia',
    },
    'a7b1rpvd': {
      'en': 'Date',
      'es': 'Fecha',
    },
    '9rhw22x8': {
      'en': 'Price',
      'es': 'Precio',
    },
    'eqnr4msm': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'pnjc4uk4': {
      'en': 'Tracking',
      'es': 'Seguimiento',
    },
    '2584l5pv': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
    },
    'dmhvpeic': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'bwp3nurh': {
      'en': '29 Desc 2022',
      'es': '29 de diciembre de 2022',
    },
    'yh9fjxd9': {
      'en': 'Price',
      'es': 'Precio',
    },
    'adatg2a1': {
      'en': '\$35.05',
      'es': '\$35.05',
    },
    'nhelf9kn': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'y6bw6vsk': {
      'en': 'Tracking',
      'es': 'Seguimiento',
    },
    '5owcnu7u': {
      'en': 'My Orders',
      'es': 'Mis pedidos',
    },
  },
  // AgregarProductosPrincipal
  {
    'ezxglu7y': {
      'en': 'Crear Producto',
      'es': 'Crear producto',
    },
    'tx874sjp': {
      'en': 'Nombre del Producto',
      'es': 'Nombre del Producto',
    },
    '9dale3p4': {
      'en': 'Descripcion',
      'es': 'Descripción',
    },
    'g8x730uj': {
      'en': 'Seleccione una categoría',
      'es': 'Seleccione una categoría',
    },
    'evfl24fg': {
      'en': 'Buscar categoría...',
      'es': 'Buscar categoría...',
    },
    'ob09w66r': {
      'en': 'Ceviches',
      'es': 'Ceviches',
    },
    'k7iwdnay': {
      'en': 'Pescados',
      'es': 'Pescados',
    },
    'ivro4tdg': {
      'en': 'Camarones',
      'es': 'Camarones',
    },
    'o4ig42b9': {
      'en': 'Stock',
      'es': 'Existencias',
    },
    'mavth9ii': {
      'en': 'Stock Minimo',
      'es': 'Stock mínimo',
    },
    '38n4wetx': {
      'en': 'Precio',
      'es': 'Precio',
    },
    'rxtzlz2n': {
      'en': 'Cantidad entera sin comas ni puntos',
      'es': 'Cantidad entera sin comas ni puntos',
    },
    'qfoy6tg6': {
      'en': 'CREAR',
      'es': 'CREAR',
    },
  },
  // Gestion_Productos
  {
    'qd4ljjat': {
      'en': 'Panel de Administración',
      'es': 'Panel de Administración',
    },
    'dwwu2ebh': {
      'en': 'Gestión de Productos',
      'es': 'Gestión de Productos',
    },
    'jl5nxzey': {
      'en': 'Selecciona una opción para administrar el inventario de productos',
      'es':
          'Selecciona una opción para administrar el inventario de productos.',
    },
    'cje3w01t': {
      'en': 'Crear Productos',
      'es': 'Crear Productos',
    },
    '3aimslej': {
      'en': 'Agregar nuevos productos al catalogo de Platillos',
      'es': 'Agregar nuevos productos al catalogo de Platillos',
    },
    '8i775884': {
      'en': 'Editar Productos',
      'es': 'Editar Productos',
    },
    'ljou0hs2': {
      'en': 'Modificar información de Platillos existentes',
      'es': 'Modificar información de Platillos existentes',
    },
    'uj5sor86': {
      'en': 'Eliminar Productos',
      'es': 'Eliminar Productos',
    },
    'trsyj5tz': {
      'en': 'Remover Platillos del inventario',
      'es': 'Removedor de Platillos del inventario',
    },
  },
  // Edita_User_Admin
  {
    'ju87fx3m': {
      'en': 'Configuración de Usuario',
      'es': 'Configuración de Usuario',
    },
    '7iybjzdg': {
      'en': 'Editar Perfil',
      'es': 'Editar perfil',
    },
    'a88gorvp': {
      'en': 'Nombre completo',
      'es': 'Nombre completo',
    },
    'dx3e2y5k': {
      'en': 'Ingresa tu nombre completo',
      'es': 'Ingresa tu nombre completo',
    },
    'hj5rww2d': {
      'en': 'Correo electrónico',
      'es': 'Correo electrónico',
    },
    'yrnntx6e': {
      'en': 'ejemplo@correo.com',
      'es': 'ejemplo@correo.com',
    },
    '06csvnae': {
      'en': 'Estado de usuario actual:',
      'es': 'Rol de usuario actual',
    },
    '0cpadtrv': {
      'en': 'Estado de usuario',
      'es': 'Rol de usuario',
    },
    't3t2zjf2': {
      'en': 'Seleccion el estado',
      'es': 'Selecciona un rol',
    },
    'myph64b3': {
      'en': 'Rol de usuario actual',
      'es': 'Rol de usuario actual',
    },
    'ysesart9': {
      'en': 'Rol de usuario',
      'es': 'Rol de usuario',
    },
    '12ifft4d': {
      'en': 'Selecciona un rol',
      'es': 'Selecciona un rol',
    },
    'yja027r8': {
      'en': 'Nueva contraseña',
      'es': 'Nueva contraseña',
    },
    '31nhibd6': {
      'en': 'Deja en blanco para mantener la actual',
      'es': 'Deja en blanco para mantener la actual',
    },
    '0szgywqi': {
      'en': 'Deja el campo de contraseña vacío si no deseas cambiarla',
      'es': 'Deja el campo de contraseña vacío si no deseas cambiarla',
    },
    'rn5va1y5': {
      'en': 'Actualizar Datos',
      'es': 'Actualizar Datos',
    },
  },
  // AgregarProductosTestBug
  {
    '3r7cndw7': {
      'en': 'Si redirige',
      'es': '',
    },
    'c81dhh8n': {
      'en': 'Home',
      'es': '',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
    },
    'h2xdozlk': {
      'en':
          'Congratulation! your account already created.\nPlease login to get amazing experience.',
      'es':
          '¡Felicitaciones! Tu cuenta ya está creada. Inicia sesión para disfrutar de una experiencia increíble.',
    },
    't4tt10im': {
      'en': 'Go to Home',
      'es': 'Ir a Inicio',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    't0wp5kyz': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
    },
    'laq1e1na': {
      'en': 'Your email address',
      'es': 'Su dirección de correo electrónico',
    },
    '4wi8kjyp': {
      'en': 'Enter your email ..',
      'es': 'Introduce tu email..',
    },
    '4ligppz0': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Create New Password',
      'es': 'Crear nueva contraseña',
    },
    'ud34pzj3': {
      'en': 'Enter youe mail or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
    },
    '96yt5u83': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '6xsz8kht': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
    },
    'w8i0tlah': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que deseas activar tu ubicación?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
    },
  },
  // addToCard_modal
  {
    'lqsllr27': {
      'en': 'Noodles',
      'es': 'Fideos',
    },
    'a2p37cxh': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
    },
    'fa7ttb41': {
      'en': '\$ ',
      'es': '\$',
    },
    '2h9d34og': {
      'en': '6,17',
      'es': '6,17',
    },
    '4qzgey7i': {
      'en': 'Add Extra Ingredients',
      'es': 'Añadir ingredientes adicionales',
    },
    'akeff4oi': {
      'en': 'Mustard',
      'es': 'Mostaza',
    },
    '03fv0zz3': {
      'en': '1 Grm',
      'es': '1 gramo',
    },
    'k9ldv5en': {
      'en': 'Onion',
      'es': 'Cebolla',
    },
    'jv08oelk': {
      'en': '1 Clove',
      'es': '1 clavo',
    },
    'fas1uqhn': {
      'en': 'Note',
      'es': 'Nota',
    },
    'cchz1fp1': {
      'en': 'Write your note here',
      'es': 'Escribe tu nota aquí',
    },
    '2afi00zd': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Beef',
      'es': 'Carne de res',
    },
    'ejo6z1g1': {
      'en': '1 Slice',
      'es': '1 rebanada',
    },
  },
  // changePaymentMethod_modal
  {
    'vdt5chjy': {
      'en': 'Payment Method',
      'es': 'Método de pago',
    },
    'zt4sy9vi': {
      'en': 'Paypall',
      'es': 'PayPal',
    },
    'omu8rwmb': {
      'en': 'sask****@mail.com',
      'es': 'sask****@mail.com',
    },
    '4ujur370': {
      'en': 'Add Payment Method',
      'es': 'Agregar método de pago',
    },
    'yx6c24gu': {
      'en': 'Upply the payment method',
      'es': 'Proporcionar el método de pago',
    },
  },
  // PaymentMethodItem
  {
    'clpxilmk': {
      'en': 'Mastercard',
      'es': 'Tarjeta MasterCard',
    },
    '7547er0v': {
      'en': '4827 8472 7424 ****',
      'es': '4827 8472 7424 ****',
    },
  },
  // orderSuccess_modal
  {
    'ai8qoftl': {
      'en': 'Order Successfully',
      'es': 'Pedido realizado con éxito',
    },
    '8w3ex41n': {
      'en':
          'Happy! Your food will be made immediately and we will send it after it\'s finished by the courier, please wait a moment.',
      'es':
          '¡Feliz! Tu comida se preparará de inmediato y la enviaremos en cuanto el mensajero la termine. Espera un momento.',
    },
    'znwujg1g': {
      'en': 'Order Tracking',
      'es': 'Seguimiento de pedidos',
    },
  },
  // MyOrderItem
  {
    '0kkxg04l': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
    },
    'ul6qwuuh': {
      'en': 'Date',
      'es': 'Fecha',
    },
    '7sa1sgoe': {
      'en': '29 Desc 2022',
      'es': '29 de diciembre de 2022',
    },
    'v2q7ytxk': {
      'en': 'Price',
      'es': 'Precio',
    },
    '7ps520k7': {
      'en': '\$35.05',
      'es': '\$35.05',
    },
    'p1ci0hje': {
      'en': 'Detail',
      'es': 'Detalle',
    },
    'qj8muj7x': {
      'en': 'Tracking',
      'es': 'Seguimiento',
    },
  },
  // ButtonOrderStatus
  {
    'eh2zj9q4': {
      'en': 'On Progress',
      'es': 'En progreso',
    },
  },
  // navigator
  {
    'w4ui9cw8': {
      'en': 'Pages',
      'es': 'Páginas',
    },
    'r9x56x9c': {
      'en': 'Add New payment method',
      'es': 'Agregar nuevo método de pago',
    },
    '74gdmugu': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
    },
    '3kzxsnf1': {
      'en': 'Shopping Cart',
      'es': 'Carro de la compra',
    },
    'i3gyatzv': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
    },
    'sjrrg2g9': {
      'en': 'Checkout',
      'es': 'Verificar',
    },
    'rtio6ax8': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '1imgxewf': {
      'en': 'Details',
      'es': 'Detalles',
    },
    's2m6hsyu': {
      'en': 'Detail Two',
      'es': 'Detalle dos',
    },
    '5df5wb6d': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'sfo0wzam': {
      'en': 'Favorite',
      'es': 'Favorito',
    },
    'cau894re': {
      'en': 'Help and Support',
      'es': 'Ayuda y soporte',
    },
    'hu2inqjs': {
      'en': 'Home',
      'es': 'Hogar',
    },
    'z0q5il1b': {
      'en': 'Home Two',
      'es': 'Casa Dos',
    },
    'cryv162n': {
      'en': 'Change Language',
      'es': 'Cambiar idioma',
    },
    'ubk0apu5': {
      'en': 'Policies',
      'es': 'Políticas',
    },
    'we3ke45m': {
      'en': 'Location',
      'es': 'Ubicación',
    },
    'hhdryzkt': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'm70he3lc': {
      'en': 'My Order',
      'es': 'Mi pedido',
    },
    '2lq6kli6': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'gnn9z841': {
      'en': 'Notification Setting',
      'es': 'Configuración de notificaciones',
    },
    'tl1qab9r': {
      'en': 'Onboarding',
      'es': 'Incorporación',
    },
    'w4d6l0xg': {
      'en': 'Security',
      'es': 'Seguridad',
    },
    '6vbi0byh': {
      'en': 'Setting',
      'es': 'Configuración',
    },
    '3wz6lqp1': {
      'en': 'Verification',
      'es': 'Verificación',
    },
    'cu78oruw': {
      'en': 'Voucher',
      'es': 'Vale',
    },
    'oj3cf9cd': {
      'en': 'Modals',
      'es': 'Modales',
    },
    'uv5rjs14': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
    },
    '6vf2cznr': {
      'en': 'Change payment method',
      'es': 'Cambiar el método de pago',
    },
    '5o9cd5e2': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    'c2evnsw5': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    '8l5zbjdz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
    },
    'askd0uki': {
      'en': 'Order Success',
      'es': 'Pedido realizado con éxito',
    },
    'kwl7igml': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
    },
    '1z4hfai6': {
      'en': 'About Template',
      'es': 'Acerca de la plantilla',
    },
    '86o94vt0': {
      'en': 'Builderking',
      'es': 'Rey constructor',
    },
  },
  // User_CreateCompletly
  {
    '6yepkavu': {
      'en': 'Usuario creado exitosamente',
      'es': 'Usuario creado exitosamente',
    },
  },
  // Mensaje_No_eliminarUser
  {
    'klh45jr7': {
      'en': 'No se puede eliminar usuario',
      'es': 'No se puede eliminar usuario',
    },
    'akdm3t5o': {
      'en': 'El usuario tiene 3 pedidos activos pendientes',
      'es': 'El usuario tiene 3 pedidos activos pendientes',
    },
  },
  // Slibar
  {
    '8lx07w87': {
      'en': 'Cevichera ',
      'es': 'Cevichera',
    },
    'ss8oc7rp': {
      'en': 'Home',
      'es': 'Hogar',
    },
    'gbwp0epi': {
      'en': 'Carrito',
      'es': 'Carrito',
    },
    'cpkr26gq': {
      'en': 'Historial',
      'es': 'Histórico',
    },
    'skz5p6n1': {
      'en': 'Soporte',
      'es': 'Soporte',
    },
    'vkty5ey5': {
      'en': 'Informacion',
      'es': 'Información',
    },
    'jvvgbhgg': {
      'en': 'Configuracion',
      'es': 'Configuración',
    },
    'mf41gikt': {
      'en': 'Menu Administrador',
      'es': 'Administrador del menú',
    },
    'ejkmaant': {
      'en': 'Ver perfil',
      'es': 'Ver perfil',
    },
  },
  // UbicacionModal
  {
    '3mgb8znr': {
      'en': 'Permite tu Ubicacion Aca!',
      'es': 'Permite tu Ubicacion Aca!',
    },
    'x81293r2': {
      'en': 'Select Location',
      'es': 'Seleccionar ubicación',
    },
    '5s1qt1ir': {
      'en': 'Selected Coordinates',
      'es': 'Coordenadas seleccionadas',
    },
    'ojq86myy': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '1gai6scc': {
      'en': 'Confirm Location',
      'es': 'Confirmar ubicación',
    },
    'sw8xt2b3': {
      'en': 'Getting your location...',
      'es': 'Obteniendo su ubicación...',
    },
  },
  // SlibarAdmin
  {
    'c6jtwarv': {
      'en': 'Cevichera Rest',
      'es': 'Cevichera Rest',
    },
    '95lpz90v': {
      'en': 'Menu Inicial',
      'es': 'Menú Inicial',
    },
    'v92m7fhu': {
      'en': 'Gestion pedidos',
      'es': 'Gestion pedidos',
    },
    'gwpn1b4d': {
      'en': 'Gestion Productos',
      'es': 'Gestion Productos',
    },
    '8vmcpwyt': {
      'en': 'Historial',
      'es': 'Histórico',
    },
    'mgaxrgrx': {
      'en': 'Inventario',
      'es': 'Inventario',
    },
    'jr6yw0sy': {
      'en': 'Reportes',
      'es': 'Informes',
    },
    'zja1ndlo': {
      'en': 'Menu Administrador',
      'es': 'Administrador del menú',
    },
    'g8iefvu4': {
      'en': 'Ver perfil',
      'es': 'Ver perfil',
    },
  },
  // registerSuccess_modalCopy
  {
    'maabrm1o': {
      'en': 'Se actualizo la Informacion',
      'es': 'Se actualizo la Informacion',
    },
    'l90j0n8f': {
      'en':
          'Congratulation! La informacion de la cuentan se actualizo correctamente.\n',
      'es':
          '¡Felicitaciones! La informacion de la cuenta se actualiza correctamente.',
    },
    'lx7yzoxu': {
      'en': 'Volver a Gestion Usuarios',
      'es': 'Volver a Gestión de Usuarios',
    },
  },
  // ListadeProductos_Historial
  {
    '4yho1f96': {
      'en': 'Lista de Productos',
      'es': 'Lista de productos',
    },
    'aa38425z': {
      'en': 'Chocolate Orgánico',
      'es': 'Chocolate orgánico',
    },
    'ytgawk41': {
      'en': 'Chocolate negro 70%',
      'es': 'Chocolate negro 70%',
    },
    'd18ncmde': {
      'en': 'Cantidad: 1',
      'es': 'Cantidad: 1',
    },
    'wbu47d62': {
      'en': '\$12.50',
      'es': '\$12.50',
    },
    'wn3qf973': {
      'en': 'Té Verde Matcha',
      'es': 'Té Verde Matcha',
    },
    '0p0tweft': {
      'en': 'Té matcha japonés',
      'es': 'Té matcha japonés',
    },
    'vi8guwnz': {
      'en': 'Cantidad: 3',
      'es': 'Cantidad: 3',
    },
    'sr60n05v': {
      'en': '\$18.75',
      'es': '\$18.75',
    },
  },
  // Datos_ActualizadosAdmin
  {
    '4eemnvj2': {
      'en': 'Datos Actualizados',
      'es': 'Datos actualizados',
    },
    'xt6ha7fz': {
      'en': 'Los datos del usuario han sido actualizados exitosamente.',
      'es': 'Los datos del usuario han sido actualizados exitosamente.',
    },
    'o76ul6vc': {
      'en': 'Modificar Otros',
      'es': 'Modificar Otros',
    },
    'ja0gzz3p': {
      'en': 'Cerrar',
      'es': 'Cerrar',
    },
  },
  // Datos_Eliminados
  {
    '4hvh9gnz': {
      'en': 'Datos Eliminados',
      'es': 'Datos eliminados',
    },
    '6pkixw53': {
      'en':
          'Los datos del usuario han sido eliminados exitosamente del sistema.',
      'es':
          'Los datos del usuario han sido eliminados exitosamente del sistema.',
    },
    'zsk1b2ti': {
      'en': 'Modificar Otros',
      'es': 'Modificar Otros',
    },
    'i72fbw63': {
      'en': 'Cerrar',
      'es': 'Cerrar',
    },
  },
  // UsuarioActualizado
  {
    'q3ruqfbh': {
      'en': '¡Datos Actualizados!',
      'es': '¡Datos actualizados!',
    },
    'y46e42b4': {
      'en': 'Tu información de usuario se ha actualizado correctamente.',
      'es': 'Tu información de usuario se ha actualizado correctamente.',
    },
    'iay086p6': {
      'en': 'Continuar Editando',
      'es': 'Continuar editando',
    },
    'wd0lfm13': {
      'en': 'Ir al Catálogo',
      'es': 'Ir al Catálogo',
    },
  },
  // CartPedido
  {
    'jk04q3jc': {
      'en': 'Cambiar estado',
      'es': 'Cambiar estado',
    },
  },
  // ListadeProductos
  {
    '9ou8v0x4': {
      'en': 'Lista de Productos',
      'es': 'Lista de productos',
    },
    '9u4xx8y5': {
      'en': 'Chocolate Orgánico',
      'es': 'Chocolate orgánico',
    },
    '2y6i2jr4': {
      'en': 'Chocolate negro 70%',
      'es': 'Chocolate negro 70%',
    },
    'eebggq1n': {
      'en': 'Cantidad: 1',
      'es': 'Cantidad: 1',
    },
    'w4drric7': {
      'en': '\$12.50',
      'es': '\$12.50',
    },
    'vndsox9x': {
      'en': 'Té Verde Matcha',
      'es': 'Té Verde Matcha',
    },
    'lk6qx3y9': {
      'en': 'Té matcha japonés',
      'es': 'Té matcha japonés',
    },
    'z1zhqq7o': {
      'en': 'Cantidad: 3',
      'es': 'Cantidad: 3',
    },
    '95oeoohb': {
      'en': '\$18.75',
      'es': '\$18.75',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Estás seguro que deseas cerrar la sesión?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Finalizar la sesión',
    },
  },
  // UsuarioActualizadoRepartidor
  {
    'selsejax': {
      'en': '¡Datos Actualizados!',
      'es': '¡Datos actualizados!',
    },
    'e9gc37vp': {
      'en': 'Tu información de usuario se ha actualizado correctamente.',
      'es': 'Tu información de usuario se ha actualizado correctamente.',
    },
    'gok3t1e1': {
      'en': 'Continuar Editando',
      'es': 'Continuar editando',
    },
    'bypm2618': {
      'en': 'Volver al panel de repartidor',
      'es': 'Ir al Catálogo',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Encontremos la comida que te gusta',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Obtenga descuento',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Introduzca el código del cupón',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'Hamburguesas',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'ohqi4eo3': {
      'en': 'Let\'s find the food you like',
      'es': 'Encontremos la comida que te gusta',
    },
    'oz22h4tz': {
      'en': '',
      'es': '',
    },
    'stga51vz': {
      'en': '',
      'es': '',
    },
    'apr24ovw': {
      'en': '',
      'es': '',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
    },
    '24nimcd7': {
      'en': '',
      'es': '',
    },
    'oc1w18sj': {
      'en': '',
      'es': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
