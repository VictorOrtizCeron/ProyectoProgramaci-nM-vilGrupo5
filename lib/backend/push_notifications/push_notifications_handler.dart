import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/ChatGPT_Image_Aug_22,_2025,_06_42_30_PM.png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Onboarding': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'LoginAccount': ParameterData.none(),
  'HistorialPedidos': ParameterData.none(),
  'Detail': (data) async => ParameterData(
        allParams: {
          'productoDetail': await getDocumentParameter<ProductoRecord>(
              data, 'productoDetail', ProductoRecord.fromSnapshot),
        },
      ),
  'Notifications': ParameterData.none(),
  'Setting': ParameterData.none(),
  'ChangePassword': ParameterData.none(),
  'Language': ParameterData.none(),
  'NotificationSetting': ParameterData.none(),
  'HelpandSupport': ParameterData.none(),
  'AdminCart': (data) async => ParameterData(
        allParams: {
          'productosEnCarrito':
              getParameter<DocumentReference>(data, 'productosEnCarrito'),
        },
      ),
  'Admin_MenuInicial': ParameterData.none(),
  'Admin_EliminarUsuario': (data) async => ParameterData(
        allParams: {
          'eliminarUser': await getDocumentParameter<UsuariosRecord>(
              data, 'eliminarUser', UsuariosRecord.fromSnapshot),
        },
      ),
  'Inventario': ParameterData.none(),
  'Admin_UsersRoles': ParameterData.none(),
  'VerInventario': ParameterData.none(),
  'AdminGestionPedidos': ParameterData.none(),
  'Repartidor_MisEntregas': ParameterData.none(),
  'ResumenOrdenUser': (data) async => ParameterData(
        allParams: {
          'ordenRef': getParameter<DocumentReference>(data, 'ordenRef'),
        },
      ),
  'VerMovInventario': (data) async => ParameterData(
        allParams: {
          'inventario': getParameter<String>(data, 'inventario'),
        },
      ),
  'VerFacturas': ParameterData.none(),
  'Menu_repartidor': ParameterData.none(),
  'ConfirmaPagoAdmin': ParameterData.none(),
  'ConfirmaPagoUser': ParameterData.none(),
  'UserCartOficial': (data) async => ParameterData(
        allParams: {
          'productosEnCarrito':
              getParameter<DocumentReference>(data, 'productosEnCarrito'),
        },
      ),
  'InventarioReporteria': ParameterData.none(),
  'CierresReporteria': ParameterData.none(),
  'ResumenOrdenAdmin': (data) async => ParameterData(
        allParams: {
          'ordenRef': getParameter<DocumentReference>(data, 'ordenRef'),
        },
      ),
  'HomeScreenUser': ParameterData.none(),
  'DetailUserOfi': (data) async => ParameterData(
        allParams: {
          'productoDetail': await getDocumentParameter<ProductoRecord>(
              data, 'productoDetail', ProductoRecord.fromSnapshot),
        },
      ),
  'SettingAdmin': ParameterData.none(),
  'HistoPedidosCatalogoAdmin': ParameterData.none(),
  'AuditoriasReporteria': ParameterData.none(),
  'AgregarProductos2': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'creadopor': getParameter<DocumentReference>(data, 'creadopor'),
          'creadotiempo': getParameter<DateTime>(data, 'creadotiempo'),
          'accion': getParameter<String>(data, 'accion'),
        },
      ),
  'EditarProductos2': (data) async => ParameterData(
        allParams: {
          'imagen': getParameter<String>(data, 'imagen'),
          'nombre': getParameter<String>(data, 'nombre'),
          'descripcion': getParameter<String>(data, 'descripcion'),
          'categoria': getParameter<String>(data, 'categoria'),
          'stock': getParameter<int>(data, 'stock'),
          'stockmin': getParameter<int>(data, 'stockmin'),
          'precio': getParameter<double>(data, 'precio'),
          'prodreferencia':
              getParameter<DocumentReference>(data, 'prodreferencia'),
        },
      ),
  'HomeScreenAdmin': ParameterData.none(),
  'EditarProductos1': ParameterData.none(),
  'EditarProductos3': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'editadopor': getParameter<DocumentReference>(data, 'editadopor'),
          'editadotiempo': getParameter<DateTime>(data, 'editadotiempo'),
          'accion': getParameter<bool>(data, 'accion'),
          'prodref2': getParameter<DocumentReference>(data, 'prodref2'),
        },
      ),
  'EliminarProductos1': ParameterData.none(),
  'EliminarProductos2': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'eliminadopor': getParameter<DocumentReference>(data, 'eliminadopor'),
          'eliminadotiempo': getParameter<DateTime>(data, 'eliminadotiempo'),
          'accion': getParameter<String>(data, 'accion'),
          'prodreferencia':
              getParameter<DocumentReference>(data, 'prodreferencia'),
        },
      ),
  'Historial_pedidosAdmin': ParameterData.none(),
  'PerfilUser': ParameterData.none(),
  'PerfilRepartidor': ParameterData.none(),
  'PerfilAdmin': ParameterData.none(),
  'HistorialPedidosCopy': ParameterData.none(),
  'AgregarProductosPrincipal': ParameterData.none(),
  'Gestion_Productos': ParameterData.none(),
  'Edita_User_Admin': (data) async => ParameterData(
        allParams: {
          'refUserAdmin': getParameter<DocumentReference>(data, 'refUserAdmin'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
