import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompraRecord extends FirestoreRecord {
  CompraRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "com_proveedor" field.
  String? _comProveedor;
  String get comProveedor => _comProveedor ?? '';
  bool hasComProveedor() => _comProveedor != null;

  // "com_fecha" field.
  DateTime? _comFecha;
  DateTime? get comFecha => _comFecha;
  bool hasComFecha() => _comFecha != null;

  // "com_monto_total" field.
  double? _comMontoTotal;
  double get comMontoTotal => _comMontoTotal ?? 0.0;
  bool hasComMontoTotal() => _comMontoTotal != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "fecha_modificacion" field.
  DateTime? _fechaModificacion;
  DateTime? get fechaModificacion => _fechaModificacion;
  bool hasFechaModificacion() => _fechaModificacion != null;

  // "creado_por" field.
  DocumentReference? _creadoPor;
  DocumentReference? get creadoPor => _creadoPor;
  bool hasCreadoPor() => _creadoPor != null;

  // "modificado_por" field.
  DocumentReference? _modificadoPor;
  DocumentReference? get modificadoPor => _modificadoPor;
  bool hasModificadoPor() => _modificadoPor != null;

  void _initializeFields() {
    _comProveedor = snapshotData['com_proveedor'] as String?;
    _comFecha = snapshotData['com_fecha'] as DateTime?;
    _comMontoTotal = castToType<double>(snapshotData['com_monto_total']);
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _fechaModificacion = snapshotData['fecha_modificacion'] as DateTime?;
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
    _modificadoPor = snapshotData['modificado_por'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('COMPRA');

  static Stream<CompraRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompraRecord.fromSnapshot(s));

  static Future<CompraRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompraRecord.fromSnapshot(s));

  static CompraRecord fromSnapshot(DocumentSnapshot snapshot) => CompraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompraRecordData({
  String? comProveedor,
  DateTime? comFecha,
  double? comMontoTotal,
  DateTime? fechaCreacion,
  DateTime? fechaModificacion,
  DocumentReference? creadoPor,
  DocumentReference? modificadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'com_proveedor': comProveedor,
      'com_fecha': comFecha,
      'com_monto_total': comMontoTotal,
      'fecha_creacion': fechaCreacion,
      'fecha_modificacion': fechaModificacion,
      'creado_por': creadoPor,
      'modificado_por': modificadoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompraRecordDocumentEquality implements Equality<CompraRecord> {
  const CompraRecordDocumentEquality();

  @override
  bool equals(CompraRecord? e1, CompraRecord? e2) {
    return e1?.comProveedor == e2?.comProveedor &&
        e1?.comFecha == e2?.comFecha &&
        e1?.comMontoTotal == e2?.comMontoTotal &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.fechaModificacion == e2?.fechaModificacion &&
        e1?.creadoPor == e2?.creadoPor &&
        e1?.modificadoPor == e2?.modificadoPor;
  }

  @override
  int hash(CompraRecord? e) => const ListEquality().hash([
        e?.comProveedor,
        e?.comFecha,
        e?.comMontoTotal,
        e?.fechaCreacion,
        e?.fechaModificacion,
        e?.creadoPor,
        e?.modificadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is CompraRecord;
}
