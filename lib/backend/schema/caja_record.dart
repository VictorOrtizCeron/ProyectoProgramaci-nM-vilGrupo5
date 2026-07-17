import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CajaRecord extends FirestoreRecord {
  CajaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "caj_fecha_apertura" field.
  DateTime? _cajFechaApertura;
  DateTime? get cajFechaApertura => _cajFechaApertura;
  bool hasCajFechaApertura() => _cajFechaApertura != null;

  // "caj_monto_inicial" field.
  double? _cajMontoInicial;
  double get cajMontoInicial => _cajMontoInicial ?? 0.0;
  bool hasCajMontoInicial() => _cajMontoInicial != null;

  // "caj_fecha_cierre" field.
  DateTime? _cajFechaCierre;
  DateTime? get cajFechaCierre => _cajFechaCierre;
  bool hasCajFechaCierre() => _cajFechaCierre != null;

  // "caj_monto_final" field.
  double? _cajMontoFinal;
  double get cajMontoFinal => _cajMontoFinal ?? 0.0;
  bool hasCajMontoFinal() => _cajMontoFinal != null;

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

  // "resposable_ref" field.
  DocumentReference? _resposableRef;
  DocumentReference? get resposableRef => _resposableRef;
  bool hasResposableRef() => _resposableRef != null;

  void _initializeFields() {
    _cajFechaApertura = snapshotData['caj_fecha_apertura'] as DateTime?;
    _cajMontoInicial = castToType<double>(snapshotData['caj_monto_inicial']);
    _cajFechaCierre = snapshotData['caj_fecha_cierre'] as DateTime?;
    _cajMontoFinal = castToType<double>(snapshotData['caj_monto_final']);
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _fechaModificacion = snapshotData['fecha_modificacion'] as DateTime?;
    _creadoPor = snapshotData['creado_por'] as DocumentReference?;
    _modificadoPor = snapshotData['modificado_por'] as DocumentReference?;
    _resposableRef = snapshotData['resposable_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CAJA');

  static Stream<CajaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CajaRecord.fromSnapshot(s));

  static Future<CajaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CajaRecord.fromSnapshot(s));

  static CajaRecord fromSnapshot(DocumentSnapshot snapshot) => CajaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CajaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CajaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CajaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CajaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCajaRecordData({
  DateTime? cajFechaApertura,
  double? cajMontoInicial,
  DateTime? cajFechaCierre,
  double? cajMontoFinal,
  DateTime? fechaCreacion,
  DateTime? fechaModificacion,
  DocumentReference? creadoPor,
  DocumentReference? modificadoPor,
  DocumentReference? resposableRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caj_fecha_apertura': cajFechaApertura,
      'caj_monto_inicial': cajMontoInicial,
      'caj_fecha_cierre': cajFechaCierre,
      'caj_monto_final': cajMontoFinal,
      'fecha_creacion': fechaCreacion,
      'fecha_modificacion': fechaModificacion,
      'creado_por': creadoPor,
      'modificado_por': modificadoPor,
      'resposable_ref': resposableRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CajaRecordDocumentEquality implements Equality<CajaRecord> {
  const CajaRecordDocumentEquality();

  @override
  bool equals(CajaRecord? e1, CajaRecord? e2) {
    return e1?.cajFechaApertura == e2?.cajFechaApertura &&
        e1?.cajMontoInicial == e2?.cajMontoInicial &&
        e1?.cajFechaCierre == e2?.cajFechaCierre &&
        e1?.cajMontoFinal == e2?.cajMontoFinal &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.fechaModificacion == e2?.fechaModificacion &&
        e1?.creadoPor == e2?.creadoPor &&
        e1?.modificadoPor == e2?.modificadoPor &&
        e1?.resposableRef == e2?.resposableRef;
  }

  @override
  int hash(CajaRecord? e) => const ListEquality().hash([
        e?.cajFechaApertura,
        e?.cajMontoInicial,
        e?.cajFechaCierre,
        e?.cajMontoFinal,
        e?.fechaCreacion,
        e?.fechaModificacion,
        e?.creadoPor,
        e?.modificadoPor,
        e?.resposableRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CajaRecord;
}
