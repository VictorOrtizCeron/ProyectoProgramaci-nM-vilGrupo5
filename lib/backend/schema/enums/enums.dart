import 'package:collection/collection.dart';

enum Roles {
  ADMIN,
  REPARTIDOR,
  CLIENTE,
  CAJERO,
}

enum UserEstadoDatos {
  Activo,
  Inactivo,
  Bloqueado,
}

enum TipoMovimientoInventario {
  Entrada,
  Salida,
  Ajuste,
}

enum EstadoPedidos {
  Recibido,
  En_Preparacion,
  Pendiente,
  En_Reparto,
  Entregado,
  Cancelado,
  Completada,
}

enum EstadoVentas {
  Completada,
  Cancelada,
}

enum MetodosdePago {
  SinpeMovil,
  Datafono,
  Efectivo,
}

/// ENTRA Y SALE DINERO
enum FlujosCajas {
  Ingreso,
  Egreso,
}

enum TiposEventos {
  CREATE,
  UPDATE,
  DELETE,
  LOGIN,
  LOGOUT,
}

enum NotificacionesEnum {
  PEDIDO,
  VENTA,
  INVENTARIO,
  GENERAL,
}

enum Repartidor {
  USUARIOS,
  wKU0jJktKqJuNC8c4aw1,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (UserEstadoDatos):
      return UserEstadoDatos.values.deserialize(value) as T?;
    case (TipoMovimientoInventario):
      return TipoMovimientoInventario.values.deserialize(value) as T?;
    case (EstadoPedidos):
      return EstadoPedidos.values.deserialize(value) as T?;
    case (EstadoVentas):
      return EstadoVentas.values.deserialize(value) as T?;
    case (MetodosdePago):
      return MetodosdePago.values.deserialize(value) as T?;
    case (FlujosCajas):
      return FlujosCajas.values.deserialize(value) as T?;
    case (TiposEventos):
      return TiposEventos.values.deserialize(value) as T?;
    case (NotificacionesEnum):
      return NotificacionesEnum.values.deserialize(value) as T?;
    case (Repartidor):
      return Repartidor.values.deserialize(value) as T?;
    default:
      return null;
  }
}
