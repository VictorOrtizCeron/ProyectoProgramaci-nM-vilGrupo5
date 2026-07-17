import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetodoPagoRecord extends FirestoreRecord {
  MetodoPagoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MP_Nombre" field.
  MetodosdePago? _mPNombre;
  MetodosdePago? get mPNombre => _mPNombre;
  bool hasMPNombre() => _mPNombre != null;

  // "MP_Descripcion" field.
  String? _mPDescripcion;
  String get mPDescripcion => _mPDescripcion ?? '';
  bool hasMPDescripcion() => _mPDescripcion != null;

  // "MP_requiere_referencia" field.
  double? _mPRequiereReferencia;
  double get mPRequiereReferencia => _mPRequiereReferencia ?? 0.0;
  bool hasMPRequiereReferencia() => _mPRequiereReferencia != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  void _initializeFields() {
    _mPNombre = snapshotData['MP_Nombre'] is MetodosdePago
        ? snapshotData['MP_Nombre']
        : deserializeEnum<MetodosdePago>(snapshotData['MP_Nombre']);
    _mPDescripcion = snapshotData['MP_Descripcion'] as String?;
    _mPRequiereReferencia =
        castToType<double>(snapshotData['MP_requiere_referencia']);
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('METODO_PAGO');

  static Stream<MetodoPagoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MetodoPagoRecord.fromSnapshot(s));

  static Future<MetodoPagoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MetodoPagoRecord.fromSnapshot(s));

  static MetodoPagoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MetodoPagoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MetodoPagoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MetodoPagoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MetodoPagoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MetodoPagoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMetodoPagoRecordData({
  MetodosdePago? mPNombre,
  String? mPDescripcion,
  double? mPRequiereReferencia,
  DateTime? fechaCreacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MP_Nombre': mPNombre,
      'MP_Descripcion': mPDescripcion,
      'MP_requiere_referencia': mPRequiereReferencia,
      'fecha_creacion': fechaCreacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class MetodoPagoRecordDocumentEquality implements Equality<MetodoPagoRecord> {
  const MetodoPagoRecordDocumentEquality();

  @override
  bool equals(MetodoPagoRecord? e1, MetodoPagoRecord? e2) {
    return e1?.mPNombre == e2?.mPNombre &&
        e1?.mPDescripcion == e2?.mPDescripcion &&
        e1?.mPRequiereReferencia == e2?.mPRequiereReferencia &&
        e1?.fechaCreacion == e2?.fechaCreacion;
  }

  @override
  int hash(MetodoPagoRecord? e) => const ListEquality().hash([
        e?.mPNombre,
        e?.mPDescripcion,
        e?.mPRequiereReferencia,
        e?.fechaCreacion
      ]);

  @override
  bool isValidKey(Object? o) => o is MetodoPagoRecord;
}
