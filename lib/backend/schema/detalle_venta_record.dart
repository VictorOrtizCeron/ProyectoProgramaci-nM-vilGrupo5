import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetalleVentaRecord extends FirestoreRecord {
  DetalleVentaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dve_cantidad" field.
  int? _dveCantidad;
  int get dveCantidad => _dveCantidad ?? 0;
  bool hasDveCantidad() => _dveCantidad != null;

  // "dve_precio_unitario" field.
  double? _dvePrecioUnitario;
  double get dvePrecioUnitario => _dvePrecioUnitario ?? 0.0;
  bool hasDvePrecioUnitario() => _dvePrecioUnitario != null;

  // "dve_subtotal" field.
  double? _dveSubtotal;
  double get dveSubtotal => _dveSubtotal ?? 0.0;
  bool hasDveSubtotal() => _dveSubtotal != null;

  // "PRODUCTO_ref" field.
  DocumentReference? _pRODUCTORef;
  DocumentReference? get pRODUCTORef => _pRODUCTORef;
  bool hasPRODUCTORef() => _pRODUCTORef != null;

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
    _dveCantidad = castToType<int>(snapshotData['dve_cantidad']);
    _dvePrecioUnitario =
        castToType<double>(snapshotData['dve_precio_unitario']);
    _dveSubtotal = castToType<double>(snapshotData['dve_subtotal']);
    _pRODUCTORef = snapshotData['PRODUCTO_ref'] as DocumentReference?;
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
          ? parent.collection('DETALLE_VENTA')
          : FirebaseFirestore.instance.collectionGroup('DETALLE_VENTA');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DETALLE_VENTA').doc(id);

  static Stream<DetalleVentaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetalleVentaRecord.fromSnapshot(s));

  static Future<DetalleVentaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetalleVentaRecord.fromSnapshot(s));

  static DetalleVentaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetalleVentaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetalleVentaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetalleVentaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetalleVentaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetalleVentaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetalleVentaRecordData({
  int? dveCantidad,
  double? dvePrecioUnitario,
  double? dveSubtotal,
  DocumentReference? pRODUCTORef,
  DateTime? fechaCreacion,
  ProductoSnapshotStruct? productoSnapshot,
  DocumentReference? creadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dve_cantidad': dveCantidad,
      'dve_precio_unitario': dvePrecioUnitario,
      'dve_subtotal': dveSubtotal,
      'PRODUCTO_ref': pRODUCTORef,
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

class DetalleVentaRecordDocumentEquality
    implements Equality<DetalleVentaRecord> {
  const DetalleVentaRecordDocumentEquality();

  @override
  bool equals(DetalleVentaRecord? e1, DetalleVentaRecord? e2) {
    return e1?.dveCantidad == e2?.dveCantidad &&
        e1?.dvePrecioUnitario == e2?.dvePrecioUnitario &&
        e1?.dveSubtotal == e2?.dveSubtotal &&
        e1?.pRODUCTORef == e2?.pRODUCTORef &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.productoSnapshot == e2?.productoSnapshot &&
        e1?.creadoPor == e2?.creadoPor;
  }

  @override
  int hash(DetalleVentaRecord? e) => const ListEquality().hash([
        e?.dveCantidad,
        e?.dvePrecioUnitario,
        e?.dveSubtotal,
        e?.pRODUCTORef,
        e?.fechaCreacion,
        e?.productoSnapshot,
        e?.creadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is DetalleVentaRecord;
}
