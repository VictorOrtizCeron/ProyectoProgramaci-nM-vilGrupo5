import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetallePedidoRecord extends FirestoreRecord {
  DetallePedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dpe_cantidad" field.
  int? _dpeCantidad;
  int get dpeCantidad => _dpeCantidad ?? 0;
  bool hasDpeCantidad() => _dpeCantidad != null;

  // "dpe_precio_unitario" field.
  double? _dpePrecioUnitario;
  double get dpePrecioUnitario => _dpePrecioUnitario ?? 0.0;
  bool hasDpePrecioUnitario() => _dpePrecioUnitario != null;

  // "dpe_subtotal" field.
  double? _dpeSubtotal;
  double get dpeSubtotal => _dpeSubtotal ?? 0.0;
  bool hasDpeSubtotal() => _dpeSubtotal != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "PRODUCTO_ref" field.
  DocumentReference? _pRODUCTORef;
  DocumentReference? get pRODUCTORef => _pRODUCTORef;
  bool hasPRODUCTORef() => _pRODUCTORef != null;

  // "producto_snapshot" field.
  ProductoSnapshotStruct? _productoSnapshot;
  ProductoSnapshotStruct get productoSnapshot =>
      _productoSnapshot ?? ProductoSnapshotStruct();
  bool hasProductoSnapshot() => _productoSnapshot != null;

  // "creado_por" field.
  DocumentReference? _creadoPor;
  DocumentReference? get creadoPor => _creadoPor;
  bool hasCreadoPor() => _creadoPor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dpeCantidad = castToType<int>(snapshotData['dpe_cantidad']);
    _dpePrecioUnitario =
        castToType<double>(snapshotData['dpe_precio_unitario']);
    _dpeSubtotal = castToType<double>(snapshotData['dpe_subtotal']);
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _pRODUCTORef = snapshotData['PRODUCTO_ref'] as DocumentReference?;
    _productoSnapshot =
        snapshotData['producto_snapshot'] is ProductoSnapshotStruct
            ? snapshotData['producto_snapshot']
            : ProductoSnapshotStruct.maybeFromMap(
                snapshotData['producto_snapshot']);
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DETALLE_PEDIDO')
          : FirebaseFirestore.instance.collectionGroup('DETALLE_PEDIDO');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DETALLE_PEDIDO').doc(id);

  static Stream<DetallePedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetallePedidoRecord.fromSnapshot(s));

  static Future<DetallePedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetallePedidoRecord.fromSnapshot(s));

  static DetallePedidoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetallePedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetallePedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetallePedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetallePedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetallePedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetallePedidoRecordData({
  int? dpeCantidad,
  double? dpePrecioUnitario,
  double? dpeSubtotal,
  DateTime? fechaCreacion,
  DocumentReference? pRODUCTORef,
  ProductoSnapshotStruct? productoSnapshot,
  DocumentReference? creadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dpe_cantidad': dpeCantidad,
      'dpe_precio_unitario': dpePrecioUnitario,
      'dpe_subtotal': dpeSubtotal,
      'fecha_creacion': fechaCreacion,
      'PRODUCTO_ref': pRODUCTORef,
      'producto_snapshot': ProductoSnapshotStruct().toMap(),
      'creado_por': creadoPor,
    }.withoutNulls,
  );

  // Handle nested data for "producto_snapshot" field.
  addProductoSnapshotStructData(
      firestoreData, productoSnapshot, 'producto_snapshot');

  return firestoreData;
}

class DetallePedidoRecordDocumentEquality
    implements Equality<DetallePedidoRecord> {
  const DetallePedidoRecordDocumentEquality();

  @override
  bool equals(DetallePedidoRecord? e1, DetallePedidoRecord? e2) {
    return e1?.dpeCantidad == e2?.dpeCantidad &&
        e1?.dpePrecioUnitario == e2?.dpePrecioUnitario &&
        e1?.dpeSubtotal == e2?.dpeSubtotal &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.pRODUCTORef == e2?.pRODUCTORef &&
        e1?.productoSnapshot == e2?.productoSnapshot &&
        e1?.creadoPor == e2?.creadoPor;
  }

  @override
  int hash(DetallePedidoRecord? e) => const ListEquality().hash([
        e?.dpeCantidad,
        e?.dpePrecioUnitario,
        e?.dpeSubtotal,
        e?.fechaCreacion,
        e?.pRODUCTORef,
        e?.productoSnapshot,
        e?.creadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is DetallePedidoRecord;
}
