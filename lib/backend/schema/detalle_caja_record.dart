import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetalleCajaRecord extends FirestoreRecord {
  DetalleCajaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DCA_FlujoCaja" field.
  FlujosCajas? _dCAFlujoCaja;
  FlujosCajas? get dCAFlujoCaja => _dCAFlujoCaja;
  bool hasDCAFlujoCaja() => _dCAFlujoCaja != null;

  // "DCA_Monto" field.
  double? _dCAMonto;
  double get dCAMonto => _dCAMonto ?? 0.0;
  bool hasDCAMonto() => _dCAMonto != null;

  // "DCA_Metodo_Pago" field.
  DocumentReference? _dCAMetodoPago;
  DocumentReference? get dCAMetodoPago => _dCAMetodoPago;
  bool hasDCAMetodoPago() => _dCAMetodoPago != null;

  // "DCA_referencia" field.
  String? _dCAReferencia;
  String get dCAReferencia => _dCAReferencia ?? '';
  bool hasDCAReferencia() => _dCAReferencia != null;

  // "nota" field.
  String? _nota;
  String get nota => _nota ?? '';
  bool hasNota() => _nota != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "creado_por" field.
  DocumentReference? _creadoPor;
  DocumentReference? get creadoPor => _creadoPor;
  bool hasCreadoPor() => _creadoPor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dCAFlujoCaja = snapshotData['DCA_FlujoCaja'] is FlujosCajas
        ? snapshotData['DCA_FlujoCaja']
        : deserializeEnum<FlujosCajas>(snapshotData['DCA_FlujoCaja']);
    _dCAMonto = castToType<double>(snapshotData['DCA_Monto']);
    _dCAMetodoPago = snapshotData['DCA_Metodo_Pago'] as DocumentReference?;
    _dCAReferencia = snapshotData['DCA_referencia'] as String?;
    _nota = snapshotData['nota'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DETALLE_CAJA')
          : FirebaseFirestore.instance.collectionGroup('DETALLE_CAJA');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DETALLE_CAJA').doc(id);

  static Stream<DetalleCajaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetalleCajaRecord.fromSnapshot(s));

  static Future<DetalleCajaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetalleCajaRecord.fromSnapshot(s));

  static DetalleCajaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetalleCajaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetalleCajaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetalleCajaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetalleCajaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetalleCajaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetalleCajaRecordData({
  FlujosCajas? dCAFlujoCaja,
  double? dCAMonto,
  DocumentReference? dCAMetodoPago,
  String? dCAReferencia,
  String? nota,
  DateTime? fechaCreacion,
  DocumentReference? creadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DCA_FlujoCaja': dCAFlujoCaja,
      'DCA_Monto': dCAMonto,
      'DCA_Metodo_Pago': dCAMetodoPago,
      'DCA_referencia': dCAReferencia,
      'nota': nota,
      'fecha_creacion': fechaCreacion,
      'creado_por': creadoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetalleCajaRecordDocumentEquality implements Equality<DetalleCajaRecord> {
  const DetalleCajaRecordDocumentEquality();

  @override
  bool equals(DetalleCajaRecord? e1, DetalleCajaRecord? e2) {
    return e1?.dCAFlujoCaja == e2?.dCAFlujoCaja &&
        e1?.dCAMonto == e2?.dCAMonto &&
        e1?.dCAMetodoPago == e2?.dCAMetodoPago &&
        e1?.dCAReferencia == e2?.dCAReferencia &&
        e1?.nota == e2?.nota &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.creadoPor == e2?.creadoPor;
  }

  @override
  int hash(DetalleCajaRecord? e) => const ListEquality().hash([
        e?.dCAFlujoCaja,
        e?.dCAMonto,
        e?.dCAMetodoPago,
        e?.dCAReferencia,
        e?.nota,
        e?.fechaCreacion,
        e?.creadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is DetalleCajaRecord;
}
