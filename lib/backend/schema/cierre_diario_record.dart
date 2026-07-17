import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CierreDiarioRecord extends FirestoreRecord {
  CierreDiarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fechaCierre" field.
  DateTime? _fechaCierre;
  DateTime? get fechaCierre => _fechaCierre;
  bool hasFechaCierre() => _fechaCierre != null;

  // "totalCierre" field.
  double? _totalCierre;
  double get totalCierre => _totalCierre ?? 0.0;
  bool hasTotalCierre() => _totalCierre != null;

  // "ventasIncluidas" field.
  List<DocumentReference>? _ventasIncluidas;
  List<DocumentReference> get ventasIncluidas => _ventasIncluidas ?? const [];
  bool hasVentasIncluidas() => _ventasIncluidas != null;

  // "totalEfectivo" field.
  double? _totalEfectivo;
  double get totalEfectivo => _totalEfectivo ?? 0.0;
  bool hasTotalEfectivo() => _totalEfectivo != null;

  // "totalSinpe" field.
  double? _totalSinpe;
  double get totalSinpe => _totalSinpe ?? 0.0;
  bool hasTotalSinpe() => _totalSinpe != null;

  // "refproducto" field.
  DocumentReference? _refproducto;
  DocumentReference? get refproducto => _refproducto;
  bool hasRefproducto() => _refproducto != null;

  void _initializeFields() {
    _fechaCierre = snapshotData['fechaCierre'] as DateTime?;
    _totalCierre = castToType<double>(snapshotData['totalCierre']);
    _ventasIncluidas = getDataList(snapshotData['ventasIncluidas']);
    _totalEfectivo = castToType<double>(snapshotData['totalEfectivo']);
    _totalSinpe = castToType<double>(snapshotData['totalSinpe']);
    _refproducto = snapshotData['refproducto'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CIERRE_DIARIO');

  static Stream<CierreDiarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CierreDiarioRecord.fromSnapshot(s));

  static Future<CierreDiarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CierreDiarioRecord.fromSnapshot(s));

  static CierreDiarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CierreDiarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CierreDiarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CierreDiarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CierreDiarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CierreDiarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCierreDiarioRecordData({
  DateTime? fechaCierre,
  double? totalCierre,
  double? totalEfectivo,
  double? totalSinpe,
  DocumentReference? refproducto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fechaCierre': fechaCierre,
      'totalCierre': totalCierre,
      'totalEfectivo': totalEfectivo,
      'totalSinpe': totalSinpe,
      'refproducto': refproducto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CierreDiarioRecordDocumentEquality
    implements Equality<CierreDiarioRecord> {
  const CierreDiarioRecordDocumentEquality();

  @override
  bool equals(CierreDiarioRecord? e1, CierreDiarioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fechaCierre == e2?.fechaCierre &&
        e1?.totalCierre == e2?.totalCierre &&
        listEquality.equals(e1?.ventasIncluidas, e2?.ventasIncluidas) &&
        e1?.totalEfectivo == e2?.totalEfectivo &&
        e1?.totalSinpe == e2?.totalSinpe &&
        e1?.refproducto == e2?.refproducto;
  }

  @override
  int hash(CierreDiarioRecord? e) => const ListEquality().hash([
        e?.fechaCierre,
        e?.totalCierre,
        e?.ventasIncluidas,
        e?.totalEfectivo,
        e?.totalSinpe,
        e?.refproducto
      ]);

  @override
  bool isValidKey(Object? o) => o is CierreDiarioRecord;
}
