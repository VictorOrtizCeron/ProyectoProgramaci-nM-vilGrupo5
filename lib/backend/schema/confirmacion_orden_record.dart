import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfirmacionOrdenRecord extends FirestoreRecord {
  ConfirmacionOrdenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Usuario_Ref" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "NumeroPedido" field.
  double? _numeroPedido;
  double get numeroPedido => _numeroPedido ?? 0.0;
  bool hasNumeroPedido() => _numeroPedido != null;

  // "HoraPedido" field.
  DateTime? _horaPedido;
  DateTime? get horaPedido => _horaPedido;
  bool hasHoraPedido() => _horaPedido != null;

  // "Telefono_Ref" field.
  DocumentReference? _telefonoRef;
  DocumentReference? get telefonoRef => _telefonoRef;
  bool hasTelefonoRef() => _telefonoRef != null;

  // "Estado" field.
  EstadoPedidos? _estado;
  EstadoPedidos? get estado => _estado;
  bool hasEstado() => _estado != null;

  // "Direccion_Ref" field.
  DocumentReference? _direccionRef;
  DocumentReference? get direccionRef => _direccionRef;
  bool hasDireccionRef() => _direccionRef != null;

  // "Ubicacion_Ref" field.
  DocumentReference? _ubicacionRef;
  DocumentReference? get ubicacionRef => _ubicacionRef;
  bool hasUbicacionRef() => _ubicacionRef != null;

  // "Repartidor_Ref" field.
  DocumentReference? _repartidorRef;
  DocumentReference? get repartidorRef => _repartidorRef;
  bool hasRepartidorRef() => _repartidorRef != null;

  void _initializeFields() {
    _usuarioRef = snapshotData['Usuario_Ref'] as DocumentReference?;
    _numeroPedido = castToType<double>(snapshotData['NumeroPedido']);
    _horaPedido = snapshotData['HoraPedido'] as DateTime?;
    _telefonoRef = snapshotData['Telefono_Ref'] as DocumentReference?;
    _estado = snapshotData['Estado'] is EstadoPedidos
        ? snapshotData['Estado']
        : deserializeEnum<EstadoPedidos>(snapshotData['Estado']);
    _direccionRef = snapshotData['Direccion_Ref'] as DocumentReference?;
    _ubicacionRef = snapshotData['Ubicacion_Ref'] as DocumentReference?;
    _repartidorRef = snapshotData['Repartidor_Ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ConfirmacionOrden');

  static Stream<ConfirmacionOrdenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfirmacionOrdenRecord.fromSnapshot(s));

  static Future<ConfirmacionOrdenRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfirmacionOrdenRecord.fromSnapshot(s));

  static ConfirmacionOrdenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfirmacionOrdenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfirmacionOrdenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfirmacionOrdenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfirmacionOrdenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfirmacionOrdenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfirmacionOrdenRecordData({
  DocumentReference? usuarioRef,
  double? numeroPedido,
  DateTime? horaPedido,
  DocumentReference? telefonoRef,
  EstadoPedidos? estado,
  DocumentReference? direccionRef,
  DocumentReference? ubicacionRef,
  DocumentReference? repartidorRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Usuario_Ref': usuarioRef,
      'NumeroPedido': numeroPedido,
      'HoraPedido': horaPedido,
      'Telefono_Ref': telefonoRef,
      'Estado': estado,
      'Direccion_Ref': direccionRef,
      'Ubicacion_Ref': ubicacionRef,
      'Repartidor_Ref': repartidorRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfirmacionOrdenRecordDocumentEquality
    implements Equality<ConfirmacionOrdenRecord> {
  const ConfirmacionOrdenRecordDocumentEquality();

  @override
  bool equals(ConfirmacionOrdenRecord? e1, ConfirmacionOrdenRecord? e2) {
    return e1?.usuarioRef == e2?.usuarioRef &&
        e1?.numeroPedido == e2?.numeroPedido &&
        e1?.horaPedido == e2?.horaPedido &&
        e1?.telefonoRef == e2?.telefonoRef &&
        e1?.estado == e2?.estado &&
        e1?.direccionRef == e2?.direccionRef &&
        e1?.ubicacionRef == e2?.ubicacionRef &&
        e1?.repartidorRef == e2?.repartidorRef;
  }

  @override
  int hash(ConfirmacionOrdenRecord? e) => const ListEquality().hash([
        e?.usuarioRef,
        e?.numeroPedido,
        e?.horaPedido,
        e?.telefonoRef,
        e?.estado,
        e?.direccionRef,
        e?.ubicacionRef,
        e?.repartidorRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfirmacionOrdenRecord;
}
