import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuariosRecord extends FirestoreRecord {
  UsuariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "UbicacionMaps" field.
  LatLng? _ubicacionMaps;
  LatLng? get ubicacionMaps => _ubicacionMaps;
  bool hasUbicacionMaps() => _ubicacionMaps != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Estado" field.
  UserEstadoDatos? _estado;
  UserEstadoDatos? get estado => _estado;
  bool hasEstado() => _estado != null;

  // "IntentosFallidos" field.
  double? _intentosFallidos;
  double get intentosFallidos => _intentosFallidos ?? 0.0;
  bool hasIntentosFallidos() => _intentosFallidos != null;

  // "TiempoBloqueo" field.
  DateTime? _tiempoBloqueo;
  DateTime? get tiempoBloqueo => _tiempoBloqueo;
  bool hasTiempoBloqueo() => _tiempoBloqueo != null;

  // "Modificado_Por" field.
  String? _modificadoPor;
  String get modificadoPor => _modificadoPor ?? '';
  bool hasModificadoPor() => _modificadoPor != null;

  // "ROLES" field.
  String? _roles;
  String get roles => _roles ?? '';
  bool hasRoles() => _roles != null;

  // "Eliminado_por" field.
  String? _eliminadoPor;
  String get eliminadoPor => _eliminadoPor ?? '';
  bool hasEliminadoPor() => _eliminadoPor != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _ubicacionMaps = snapshotData['UbicacionMaps'] as LatLng?;
    _direccion = snapshotData['Direccion'] as String?;
    _estado = snapshotData['Estado'] is UserEstadoDatos
        ? snapshotData['Estado']
        : deserializeEnum<UserEstadoDatos>(snapshotData['Estado']);
    _intentosFallidos = castToType<double>(snapshotData['IntentosFallidos']);
    _tiempoBloqueo = snapshotData['TiempoBloqueo'] as DateTime?;
    _modificadoPor = snapshotData['Modificado_Por'] as String?;
    _roles = snapshotData['ROLES'] as String?;
    _eliminadoPor = snapshotData['Eliminado_por'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USUARIOS');

  static Stream<UsuariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsuariosRecord.fromSnapshot(s));

  static Future<UsuariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsuariosRecord.fromSnapshot(s));

  static UsuariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsuariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsuariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsuariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsuariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsuariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsuariosRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? password,
  LatLng? ubicacionMaps,
  String? direccion,
  UserEstadoDatos? estado,
  double? intentosFallidos,
  DateTime? tiempoBloqueo,
  String? modificadoPor,
  String? roles,
  String? eliminadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'password': password,
      'UbicacionMaps': ubicacionMaps,
      'Direccion': direccion,
      'Estado': estado,
      'IntentosFallidos': intentosFallidos,
      'TiempoBloqueo': tiempoBloqueo,
      'Modificado_Por': modificadoPor,
      'ROLES': roles,
      'Eliminado_por': eliminadoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsuariosRecordDocumentEquality implements Equality<UsuariosRecord> {
  const UsuariosRecordDocumentEquality();

  @override
  bool equals(UsuariosRecord? e1, UsuariosRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.password == e2?.password &&
        e1?.ubicacionMaps == e2?.ubicacionMaps &&
        e1?.direccion == e2?.direccion &&
        e1?.estado == e2?.estado &&
        e1?.intentosFallidos == e2?.intentosFallidos &&
        e1?.tiempoBloqueo == e2?.tiempoBloqueo &&
        e1?.modificadoPor == e2?.modificadoPor &&
        e1?.roles == e2?.roles &&
        e1?.eliminadoPor == e2?.eliminadoPor;
  }

  @override
  int hash(UsuariosRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.password,
        e?.ubicacionMaps,
        e?.direccion,
        e?.estado,
        e?.intentosFallidos,
        e?.tiempoBloqueo,
        e?.modificadoPor,
        e?.roles,
        e?.eliminadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is UsuariosRecord;
}
