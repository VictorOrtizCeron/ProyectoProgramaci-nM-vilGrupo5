import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoRecord extends FirestoreRecord {
  PedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Ped_Estado" field.
  EstadoPedidos? _pedEstado;
  EstadoPedidos? get pedEstado => _pedEstado;
  bool hasPedEstado() => _pedEstado != null;

  // "Ped_Total" field.
  double? _pedTotal;
  double get pedTotal => _pedTotal ?? 0.0;
  bool hasPedTotal() => _pedTotal != null;

  // "Ped_Fecha_Hora" field.
  DateTime? _pedFechaHora;
  DateTime? get pedFechaHora => _pedFechaHora;
  bool hasPedFechaHora() => _pedFechaHora != null;

  // "Ped_Efectivo_Cliente" field.
  double? _pedEfectivoCliente;
  double get pedEfectivoCliente => _pedEfectivoCliente ?? 0.0;
  bool hasPedEfectivoCliente() => _pedEfectivoCliente != null;

  // "Ped_SubTotal" field.
  double? _pedSubTotal;
  double get pedSubTotal => _pedSubTotal ?? 0.0;
  bool hasPedSubTotal() => _pedSubTotal != null;

  // "Ped_IVA" field.
  double? _pedIVA;
  double get pedIVA => _pedIVA ?? 0.0;
  bool hasPedIVA() => _pedIVA != null;

  // "Ped_Descuento" field.
  double? _pedDescuento;
  double get pedDescuento => _pedDescuento ?? 0.0;
  bool hasPedDescuento() => _pedDescuento != null;

  // "Ped_DireccionEnvio" field.
  LatLng? _pedDireccionEnvio;
  LatLng? get pedDireccionEnvio => _pedDireccionEnvio;
  bool hasPedDireccionEnvio() => _pedDireccionEnvio != null;

  // "Cliente_Ref" field.
  DocumentReference? _clienteRef;
  DocumentReference? get clienteRef => _clienteRef;
  bool hasClienteRef() => _clienteRef != null;

  // "Repartidor_Ref" field.
  DocumentReference? _repartidorRef;
  DocumentReference? get repartidorRef => _repartidorRef;
  bool hasRepartidorRef() => _repartidorRef != null;

  // "Entrega_Fecha_Hora" field.
  DateTime? _entregaFechaHora;
  DateTime? get entregaFechaHora => _entregaFechaHora;
  bool hasEntregaFechaHora() => _entregaFechaHora != null;

  // "Num_PedidoRef" field.
  String? _numPedidoRef;
  String get numPedidoRef => _numPedidoRef ?? '';
  bool hasNumPedidoRef() => _numPedidoRef != null;

  // "Carrito_Ref" field.
  DocumentReference? _carritoRef;
  DocumentReference? get carritoRef => _carritoRef;
  bool hasCarritoRef() => _carritoRef != null;

  // "Producto_Red" field.
  DocumentReference? _productoRed;
  DocumentReference? get productoRed => _productoRed;
  bool hasProductoRed() => _productoRed != null;

  // "MetodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  void _initializeFields() {
    _pedEstado = snapshotData['Ped_Estado'] is EstadoPedidos
        ? snapshotData['Ped_Estado']
        : deserializeEnum<EstadoPedidos>(snapshotData['Ped_Estado']);
    _pedTotal = castToType<double>(snapshotData['Ped_Total']);
    _pedFechaHora = snapshotData['Ped_Fecha_Hora'] as DateTime?;
    _pedEfectivoCliente =
        castToType<double>(snapshotData['Ped_Efectivo_Cliente']);
    _pedSubTotal = castToType<double>(snapshotData['Ped_SubTotal']);
    _pedIVA = castToType<double>(snapshotData['Ped_IVA']);
    _pedDescuento = castToType<double>(snapshotData['Ped_Descuento']);
    _pedDireccionEnvio = snapshotData['Ped_DireccionEnvio'] as LatLng?;
    _clienteRef = snapshotData['Cliente_Ref'] as DocumentReference?;
    _repartidorRef = snapshotData['Repartidor_Ref'] as DocumentReference?;
    _entregaFechaHora = snapshotData['Entrega_Fecha_Hora'] as DateTime?;
    _numPedidoRef = snapshotData['Num_PedidoRef'] as String?;
    _carritoRef = snapshotData['Carrito_Ref'] as DocumentReference?;
    _productoRed = snapshotData['Producto_Red'] as DocumentReference?;
    _metodoPago = snapshotData['MetodoPago'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PEDIDO');

  static Stream<PedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidoRecord.fromSnapshot(s));

  static Future<PedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidoRecord.fromSnapshot(s));

  static PedidoRecord fromSnapshot(DocumentSnapshot snapshot) => PedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidoRecordData({
  EstadoPedidos? pedEstado,
  double? pedTotal,
  DateTime? pedFechaHora,
  double? pedEfectivoCliente,
  double? pedSubTotal,
  double? pedIVA,
  double? pedDescuento,
  LatLng? pedDireccionEnvio,
  DocumentReference? clienteRef,
  DocumentReference? repartidorRef,
  DateTime? entregaFechaHora,
  String? numPedidoRef,
  DocumentReference? carritoRef,
  DocumentReference? productoRed,
  String? metodoPago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Ped_Estado': pedEstado,
      'Ped_Total': pedTotal,
      'Ped_Fecha_Hora': pedFechaHora,
      'Ped_Efectivo_Cliente': pedEfectivoCliente,
      'Ped_SubTotal': pedSubTotal,
      'Ped_IVA': pedIVA,
      'Ped_Descuento': pedDescuento,
      'Ped_DireccionEnvio': pedDireccionEnvio,
      'Cliente_Ref': clienteRef,
      'Repartidor_Ref': repartidorRef,
      'Entrega_Fecha_Hora': entregaFechaHora,
      'Num_PedidoRef': numPedidoRef,
      'Carrito_Ref': carritoRef,
      'Producto_Red': productoRed,
      'MetodoPago': metodoPago,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidoRecordDocumentEquality implements Equality<PedidoRecord> {
  const PedidoRecordDocumentEquality();

  @override
  bool equals(PedidoRecord? e1, PedidoRecord? e2) {
    return e1?.pedEstado == e2?.pedEstado &&
        e1?.pedTotal == e2?.pedTotal &&
        e1?.pedFechaHora == e2?.pedFechaHora &&
        e1?.pedEfectivoCliente == e2?.pedEfectivoCliente &&
        e1?.pedSubTotal == e2?.pedSubTotal &&
        e1?.pedIVA == e2?.pedIVA &&
        e1?.pedDescuento == e2?.pedDescuento &&
        e1?.pedDireccionEnvio == e2?.pedDireccionEnvio &&
        e1?.clienteRef == e2?.clienteRef &&
        e1?.repartidorRef == e2?.repartidorRef &&
        e1?.entregaFechaHora == e2?.entregaFechaHora &&
        e1?.numPedidoRef == e2?.numPedidoRef &&
        e1?.carritoRef == e2?.carritoRef &&
        e1?.productoRed == e2?.productoRed &&
        e1?.metodoPago == e2?.metodoPago;
  }

  @override
  int hash(PedidoRecord? e) => const ListEquality().hash([
        e?.pedEstado,
        e?.pedTotal,
        e?.pedFechaHora,
        e?.pedEfectivoCliente,
        e?.pedSubTotal,
        e?.pedIVA,
        e?.pedDescuento,
        e?.pedDireccionEnvio,
        e?.clienteRef,
        e?.repartidorRef,
        e?.entregaFechaHora,
        e?.numPedidoRef,
        e?.carritoRef,
        e?.productoRed,
        e?.metodoPago
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidoRecord;
}
