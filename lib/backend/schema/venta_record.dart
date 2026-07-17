import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VentaRecord extends FirestoreRecord {
  VentaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Vent_Fecha_Hora" field.
  DateTime? _ventFechaHora;
  DateTime? get ventFechaHora => _ventFechaHora;
  bool hasVentFechaHora() => _ventFechaHora != null;

  // "Vent_Total" field.
  double? _ventTotal;
  double get ventTotal => _ventTotal ?? 0.0;
  bool hasVentTotal() => _ventTotal != null;

  // "Vent_Descuento" field.
  double? _ventDescuento;
  double get ventDescuento => _ventDescuento ?? 0.0;
  bool hasVentDescuento() => _ventDescuento != null;

  // "Vent_Estado" field.
  EstadoVentas? _ventEstado;
  EstadoVentas? get ventEstado => _ventEstado;
  bool hasVentEstado() => _ventEstado != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "fecha_modificacion" field.
  DateTime? _fechaModificacion;
  DateTime? get fechaModificacion => _fechaModificacion;
  bool hasFechaModificacion() => _fechaModificacion != null;

  // "Cajero_ref" field.
  DocumentReference? _cajeroRef;
  DocumentReference? get cajeroRef => _cajeroRef;
  bool hasCajeroRef() => _cajeroRef != null;

  // "creado_por" field.
  DocumentReference? _creadoPor;
  DocumentReference? get creadoPor => _creadoPor;
  bool hasCreadoPor() => _creadoPor != null;

  // "modificado_por" field.
  DocumentReference? _modificadoPor;
  DocumentReference? get modificadoPor => _modificadoPor;
  bool hasModificadoPor() => _modificadoPor != null;

  // "metodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  // "fecha_anulacion" field.
  DateTime? _fechaAnulacion;
  DateTime? get fechaAnulacion => _fechaAnulacion;
  bool hasFechaAnulacion() => _fechaAnulacion != null;

  // "anulado_por" field.
  String? _anuladoPor;
  String get anuladoPor => _anuladoPor ?? '';
  bool hasAnuladoPor() => _anuladoPor != null;

  // "Usuario_Ref" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "Num_Pedido" field.
  String? _numPedido;
  String get numPedido => _numPedido ?? '';
  bool hasNumPedido() => _numPedido != null;

  // "Carrito_Ref" field.
  DocumentReference? _carritoRef;
  DocumentReference? get carritoRef => _carritoRef;
  bool hasCarritoRef() => _carritoRef != null;

  // "Estado_Pedido" field.
  EstadoPedidos? _estadoPedido;
  EstadoPedidos? get estadoPedido => _estadoPedido;
  bool hasEstadoPedido() => _estadoPedido != null;

  void _initializeFields() {
    _ventFechaHora = snapshotData['Vent_Fecha_Hora'] as DateTime?;
    _ventTotal = castToType<double>(snapshotData['Vent_Total']);
    _ventDescuento = castToType<double>(snapshotData['Vent_Descuento']);
    _ventEstado = snapshotData['Vent_Estado'] is EstadoVentas
        ? snapshotData['Vent_Estado']
        : deserializeEnum<EstadoVentas>(snapshotData['Vent_Estado']);
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _fechaModificacion = snapshotData['fecha_modificacion'] as DateTime?;
    _cajeroRef = snapshotData['Cajero_ref'] as DocumentReference?;
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
    _modificadoPor = snapshotData['modificado_por'] as DocumentReference?;
    _metodoPago = snapshotData['metodoPago'] as String?;
    _fechaAnulacion = snapshotData['fecha_anulacion'] as DateTime?;
    _anuladoPor = snapshotData['anulado_por'] as String?;
    _usuarioRef = snapshotData['Usuario_Ref'] as DocumentReference?;
    _numPedido = snapshotData['Num_Pedido'] as String?;
    _carritoRef = snapshotData['Carrito_Ref'] as DocumentReference?;
    _estadoPedido = snapshotData['Estado_Pedido'] is EstadoPedidos
        ? snapshotData['Estado_Pedido']
        : deserializeEnum<EstadoPedidos>(snapshotData['Estado_Pedido']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VENTA');

  static Stream<VentaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VentaRecord.fromSnapshot(s));

  static Future<VentaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VentaRecord.fromSnapshot(s));

  static VentaRecord fromSnapshot(DocumentSnapshot snapshot) => VentaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VentaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VentaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VentaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VentaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVentaRecordData({
  DateTime? ventFechaHora,
  double? ventTotal,
  double? ventDescuento,
  EstadoVentas? ventEstado,
  DateTime? fechaCreacion,
  DateTime? fechaModificacion,
  DocumentReference? cajeroRef,
  DocumentReference? creadoPor,
  DocumentReference? modificadoPor,
  String? metodoPago,
  DateTime? fechaAnulacion,
  String? anuladoPor,
  DocumentReference? usuarioRef,
  String? numPedido,
  DocumentReference? carritoRef,
  EstadoPedidos? estadoPedido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Vent_Fecha_Hora': ventFechaHora,
      'Vent_Total': ventTotal,
      'Vent_Descuento': ventDescuento,
      'Vent_Estado': ventEstado,
      'fecha_creacion': fechaCreacion,
      'fecha_modificacion': fechaModificacion,
      'Cajero_ref': cajeroRef,
      'creado_por': creadoPor,
      'modificado_por': modificadoPor,
      'metodoPago': metodoPago,
      'fecha_anulacion': fechaAnulacion,
      'anulado_por': anuladoPor,
      'Usuario_Ref': usuarioRef,
      'Num_Pedido': numPedido,
      'Carrito_Ref': carritoRef,
      'Estado_Pedido': estadoPedido,
    }.withoutNulls,
  );

  return firestoreData;
}

class VentaRecordDocumentEquality implements Equality<VentaRecord> {
  const VentaRecordDocumentEquality();

  @override
  bool equals(VentaRecord? e1, VentaRecord? e2) {
    return e1?.ventFechaHora == e2?.ventFechaHora &&
        e1?.ventTotal == e2?.ventTotal &&
        e1?.ventDescuento == e2?.ventDescuento &&
        e1?.ventEstado == e2?.ventEstado &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.fechaModificacion == e2?.fechaModificacion &&
        e1?.cajeroRef == e2?.cajeroRef &&
        e1?.creadoPor == e2?.creadoPor &&
        e1?.modificadoPor == e2?.modificadoPor &&
        e1?.metodoPago == e2?.metodoPago &&
        e1?.fechaAnulacion == e2?.fechaAnulacion &&
        e1?.anuladoPor == e2?.anuladoPor &&
        e1?.usuarioRef == e2?.usuarioRef &&
        e1?.numPedido == e2?.numPedido &&
        e1?.carritoRef == e2?.carritoRef &&
        e1?.estadoPedido == e2?.estadoPedido;
  }

  @override
  int hash(VentaRecord? e) => const ListEquality().hash([
        e?.ventFechaHora,
        e?.ventTotal,
        e?.ventDescuento,
        e?.ventEstado,
        e?.fechaCreacion,
        e?.fechaModificacion,
        e?.cajeroRef,
        e?.creadoPor,
        e?.modificadoPor,
        e?.metodoPago,
        e?.fechaAnulacion,
        e?.anuladoPor,
        e?.usuarioRef,
        e?.numPedido,
        e?.carritoRef,
        e?.estadoPedido
      ]);

  @override
  bool isValidKey(Object? o) => o is VentaRecord;
}
