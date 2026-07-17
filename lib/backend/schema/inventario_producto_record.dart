import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventarioProductoRecord extends FirestoreRecord {
  InventarioProductoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "producto" field.
  DocumentReference? _producto;
  DocumentReference? get producto => _producto;
  bool hasProducto() => _producto != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "quienEntrega" field.
  DocumentReference? _quienEntrega;
  DocumentReference? get quienEntrega => _quienEntrega;
  bool hasQuienEntrega() => _quienEntrega != null;

  // "quienRecibe" field.
  DocumentReference? _quienRecibe;
  DocumentReference? get quienRecibe => _quienRecibe;
  bool hasQuienRecibe() => _quienRecibe != null;

  // "fechaRegistro" field.
  DateTime? _fechaRegistro;
  DateTime? get fechaRegistro => _fechaRegistro;
  bool hasFechaRegistro() => _fechaRegistro != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "cantActual" field.
  int? _cantActual;
  int get cantActual => _cantActual ?? 0;
  bool hasCantActual() => _cantActual != null;

  void _initializeFields() {
    _producto = snapshotData['producto'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _quienEntrega = snapshotData['quienEntrega'] as DocumentReference?;
    _quienRecibe = snapshotData['quienRecibe'] as DocumentReference?;
    _fechaRegistro = snapshotData['fechaRegistro'] as DateTime?;
    _tipo = snapshotData['tipo'] as String?;
    _cantActual = castToType<int>(snapshotData['cantActual']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InventarioProducto');

  static Stream<InventarioProductoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventarioProductoRecord.fromSnapshot(s));

  static Future<InventarioProductoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InventarioProductoRecord.fromSnapshot(s));

  static InventarioProductoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventarioProductoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventarioProductoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventarioProductoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventarioProductoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventarioProductoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventarioProductoRecordData({
  DocumentReference? producto,
  int? cantidad,
  DocumentReference? quienEntrega,
  DocumentReference? quienRecibe,
  DateTime? fechaRegistro,
  String? tipo,
  int? cantActual,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'producto': producto,
      'cantidad': cantidad,
      'quienEntrega': quienEntrega,
      'quienRecibe': quienRecibe,
      'fechaRegistro': fechaRegistro,
      'tipo': tipo,
      'cantActual': cantActual,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventarioProductoRecordDocumentEquality
    implements Equality<InventarioProductoRecord> {
  const InventarioProductoRecordDocumentEquality();

  @override
  bool equals(InventarioProductoRecord? e1, InventarioProductoRecord? e2) {
    return e1?.producto == e2?.producto &&
        e1?.cantidad == e2?.cantidad &&
        e1?.quienEntrega == e2?.quienEntrega &&
        e1?.quienRecibe == e2?.quienRecibe &&
        e1?.fechaRegistro == e2?.fechaRegistro &&
        e1?.tipo == e2?.tipo &&
        e1?.cantActual == e2?.cantActual;
  }

  @override
  int hash(InventarioProductoRecord? e) => const ListEquality().hash([
        e?.producto,
        e?.cantidad,
        e?.quienEntrega,
        e?.quienRecibe,
        e?.fechaRegistro,
        e?.tipo,
        e?.cantActual
      ]);

  @override
  bool isValidKey(Object? o) => o is InventarioProductoRecord;
}
