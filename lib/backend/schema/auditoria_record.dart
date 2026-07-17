import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuditoriaRecord extends FirestoreRecord {
  AuditoriaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha_AUD" field.
  DateTime? _fechaAUD;
  DateTime? get fechaAUD => _fechaAUD;
  bool hasFechaAUD() => _fechaAUD != null;

  // "accion_AUD" field.
  String? _accionAUD;
  String get accionAUD => _accionAUD ?? '';
  bool hasAccionAUD() => _accionAUD != null;

  // "usuario_AUD" field.
  DocumentReference? _usuarioAUD;
  DocumentReference? get usuarioAUD => _usuarioAUD;
  bool hasUsuarioAUD() => _usuarioAUD != null;

  // "producto_AUD" field.
  String? _productoAUD;
  String get productoAUD => _productoAUD ?? '';
  bool hasProductoAUD() => _productoAUD != null;

  // "tabla_AUD" field.
  String? _tablaAUD;
  String get tablaAUD => _tablaAUD ?? '';
  bool hasTablaAUD() => _tablaAUD != null;

  void _initializeFields() {
    _fechaAUD = snapshotData['fecha_AUD'] as DateTime?;
    _accionAUD = snapshotData['accion_AUD'] as String?;
    _usuarioAUD = snapshotData['usuario_AUD'] as DocumentReference?;
    _productoAUD = snapshotData['producto_AUD'] as String?;
    _tablaAUD = snapshotData['tabla_AUD'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AUDITORIA');

  static Stream<AuditoriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuditoriaRecord.fromSnapshot(s));

  static Future<AuditoriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuditoriaRecord.fromSnapshot(s));

  static AuditoriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuditoriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuditoriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuditoriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuditoriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuditoriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuditoriaRecordData({
  DateTime? fechaAUD,
  String? accionAUD,
  DocumentReference? usuarioAUD,
  String? productoAUD,
  String? tablaAUD,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_AUD': fechaAUD,
      'accion_AUD': accionAUD,
      'usuario_AUD': usuarioAUD,
      'producto_AUD': productoAUD,
      'tabla_AUD': tablaAUD,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuditoriaRecordDocumentEquality implements Equality<AuditoriaRecord> {
  const AuditoriaRecordDocumentEquality();

  @override
  bool equals(AuditoriaRecord? e1, AuditoriaRecord? e2) {
    return e1?.fechaAUD == e2?.fechaAUD &&
        e1?.accionAUD == e2?.accionAUD &&
        e1?.usuarioAUD == e2?.usuarioAUD &&
        e1?.productoAUD == e2?.productoAUD &&
        e1?.tablaAUD == e2?.tablaAUD;
  }

  @override
  int hash(AuditoriaRecord? e) => const ListEquality().hash(
      [e?.fechaAUD, e?.accionAUD, e?.usuarioAUD, e?.productoAUD, e?.tablaAUD]);

  @override
  bool isValidKey(Object? o) => o is AuditoriaRecord;
}
