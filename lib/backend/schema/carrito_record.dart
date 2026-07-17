import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "producto" field.
  DocumentReference? _producto;
  DocumentReference? get producto => _producto;
  bool hasProducto() => _producto != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "Cliente_Ref" field.
  DocumentReference? _clienteRef;
  DocumentReference? get clienteRef => _clienteRef;
  bool hasClienteRef() => _clienteRef != null;

  // "fecha_estado" field.
  DateTime? _fechaEstado;
  DateTime? get fechaEstado => _fechaEstado;
  bool hasFechaEstado() => _fechaEstado != null;

  // "NumPedidoRef" field.
  String? _numPedidoRef;
  String get numPedidoRef => _numPedidoRef ?? '';
  bool hasNumPedidoRef() => _numPedidoRef != null;

  void _initializeFields() {
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _producto = snapshotData['producto'] as DocumentReference?;
    _estado = snapshotData['estado'] as String?;
    _clienteRef = snapshotData['Cliente_Ref'] as DocumentReference?;
    _fechaEstado = snapshotData['fecha_estado'] as DateTime?;
    _numPedidoRef = snapshotData['NumPedidoRef'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CARRITO');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  int? cantidad,
  double? subtotal,
  DocumentReference? producto,
  String? estado,
  DocumentReference? clienteRef,
  DateTime? fechaEstado,
  String? numPedidoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cantidad': cantidad,
      'subtotal': subtotal,
      'producto': producto,
      'estado': estado,
      'Cliente_Ref': clienteRef,
      'fecha_estado': fechaEstado,
      'NumPedidoRef': numPedidoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    return e1?.cantidad == e2?.cantidad &&
        e1?.subtotal == e2?.subtotal &&
        e1?.producto == e2?.producto &&
        e1?.estado == e2?.estado &&
        e1?.clienteRef == e2?.clienteRef &&
        e1?.fechaEstado == e2?.fechaEstado &&
        e1?.numPedidoRef == e2?.numPedidoRef;
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality().hash([
        e?.cantidad,
        e?.subtotal,
        e?.producto,
        e?.estado,
        e?.clienteRef,
        e?.fechaEstado,
        e?.numPedidoRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
