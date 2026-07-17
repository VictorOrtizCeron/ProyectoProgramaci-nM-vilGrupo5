import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetalleCompraRecord extends FirestoreRecord {
  DetalleCompraRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dcom_cantidad" field.
  int? _dcomCantidad;
  int get dcomCantidad => _dcomCantidad ?? 0;
  bool hasDcomCantidad() => _dcomCantidad != null;

  // "dcom_precio_unitario" field.
  double? _dcomPrecioUnitario;
  double get dcomPrecioUnitario => _dcomPrecioUnitario ?? 0.0;
  bool hasDcomPrecioUnitario() => _dcomPrecioUnitario != null;

  // "dcom_subtotal" field.
  double? _dcomSubtotal;
  double get dcomSubtotal => _dcomSubtotal ?? 0.0;
  bool hasDcomSubtotal() => _dcomSubtotal != null;

  // "PRODUCTO_pro_id" field.
  DocumentReference? _pRODUCTOProId;
  DocumentReference? get pRODUCTOProId => _pRODUCTOProId;
  bool hasPRODUCTOProId() => _pRODUCTOProId != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

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
    _dcomCantidad = castToType<int>(snapshotData['dcom_cantidad']);
    _dcomPrecioUnitario =
        castToType<double>(snapshotData['dcom_precio_unitario']);
    _dcomSubtotal = castToType<double>(snapshotData['dcom_subtotal']);
    _pRODUCTOProId = snapshotData['PRODUCTO_pro_id'] as DocumentReference?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _productoSnapshot =
        snapshotData['producto_snapshot'] is ProductoSnapshotStruct
            ? snapshotData['producto_snapshot']
            : ProductoSnapshotStruct.maybeFromMap(
                snapshotData['producto_snapshot']);
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DETALLE_COMPRA')
          : FirebaseFirestore.instance.collectionGroup('DETALLE_COMPRA');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DETALLE_COMPRA').doc(id);

  static Stream<DetalleCompraRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetalleCompraRecord.fromSnapshot(s));

  static Future<DetalleCompraRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetalleCompraRecord.fromSnapshot(s));

  static DetalleCompraRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetalleCompraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetalleCompraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetalleCompraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetalleCompraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetalleCompraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetalleCompraRecordData({
  int? dcomCantidad,
  double? dcomPrecioUnitario,
  double? dcomSubtotal,
  DocumentReference? pRODUCTOProId,
  DateTime? fechaCreacion,
  ProductoSnapshotStruct? productoSnapshot,
  DocumentReference? creadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dcom_cantidad': dcomCantidad,
      'dcom_precio_unitario': dcomPrecioUnitario,
      'dcom_subtotal': dcomSubtotal,
      'PRODUCTO_pro_id': pRODUCTOProId,
      'fecha_creacion': fechaCreacion,
      'producto_snapshot': ProductoSnapshotStruct().toMap(),
      'creado_por': creadoPor,
    }.withoutNulls,
  );

  // Handle nested data for "producto_snapshot" field.
  addProductoSnapshotStructData(
      firestoreData, productoSnapshot, 'producto_snapshot');

  return firestoreData;
}

class DetalleCompraRecordDocumentEquality
    implements Equality<DetalleCompraRecord> {
  const DetalleCompraRecordDocumentEquality();

  @override
  bool equals(DetalleCompraRecord? e1, DetalleCompraRecord? e2) {
    return e1?.dcomCantidad == e2?.dcomCantidad &&
        e1?.dcomPrecioUnitario == e2?.dcomPrecioUnitario &&
        e1?.dcomSubtotal == e2?.dcomSubtotal &&
        e1?.pRODUCTOProId == e2?.pRODUCTOProId &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.productoSnapshot == e2?.productoSnapshot &&
        e1?.creadoPor == e2?.creadoPor;
  }

  @override
  int hash(DetalleCompraRecord? e) => const ListEquality().hash([
        e?.dcomCantidad,
        e?.dcomPrecioUnitario,
        e?.dcomSubtotal,
        e?.pRODUCTOProId,
        e?.fechaCreacion,
        e?.productoSnapshot,
        e?.creadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is DetalleCompraRecord;
}
