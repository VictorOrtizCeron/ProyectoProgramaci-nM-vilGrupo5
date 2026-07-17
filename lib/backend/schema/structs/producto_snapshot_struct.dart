// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductoSnapshotStruct extends FFFirebaseStruct {
  ProductoSnapshotStruct({
    String? proNombre,
    double? proPrecio,
    String? proFotoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _proNombre = proNombre,
        _proPrecio = proPrecio,
        _proFotoUrl = proFotoUrl,
        super(firestoreUtilData);

  // "pro_nombre" field.
  String? _proNombre;
  String get proNombre => _proNombre ?? '';
  set proNombre(String? val) => _proNombre = val;

  bool hasProNombre() => _proNombre != null;

  // "pro_precio" field.
  double? _proPrecio;
  double get proPrecio => _proPrecio ?? 0.0;
  set proPrecio(double? val) => _proPrecio = val;

  void incrementProPrecio(double amount) => proPrecio = proPrecio + amount;

  bool hasProPrecio() => _proPrecio != null;

  // "pro_foto_url" field.
  String? _proFotoUrl;
  String get proFotoUrl => _proFotoUrl ?? '';
  set proFotoUrl(String? val) => _proFotoUrl = val;

  bool hasProFotoUrl() => _proFotoUrl != null;

  static ProductoSnapshotStruct fromMap(Map<String, dynamic> data) =>
      ProductoSnapshotStruct(
        proNombre: data['pro_nombre'] as String?,
        proPrecio: castToType<double>(data['pro_precio']),
        proFotoUrl: data['pro_foto_url'] as String?,
      );

  static ProductoSnapshotStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductoSnapshotStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pro_nombre': _proNombre,
        'pro_precio': _proPrecio,
        'pro_foto_url': _proFotoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pro_nombre': serializeParam(
          _proNombre,
          ParamType.String,
        ),
        'pro_precio': serializeParam(
          _proPrecio,
          ParamType.double,
        ),
        'pro_foto_url': serializeParam(
          _proFotoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductoSnapshotStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductoSnapshotStruct(
        proNombre: deserializeParam(
          data['pro_nombre'],
          ParamType.String,
          false,
        ),
        proPrecio: deserializeParam(
          data['pro_precio'],
          ParamType.double,
          false,
        ),
        proFotoUrl: deserializeParam(
          data['pro_foto_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductoSnapshotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductoSnapshotStruct &&
        proNombre == other.proNombre &&
        proPrecio == other.proPrecio &&
        proFotoUrl == other.proFotoUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([proNombre, proPrecio, proFotoUrl]);
}

ProductoSnapshotStruct createProductoSnapshotStruct({
  String? proNombre,
  double? proPrecio,
  String? proFotoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductoSnapshotStruct(
      proNombre: proNombre,
      proPrecio: proPrecio,
      proFotoUrl: proFotoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductoSnapshotStruct? updateProductoSnapshotStruct(
  ProductoSnapshotStruct? productoSnapshot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productoSnapshot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductoSnapshotStructData(
  Map<String, dynamic> firestoreData,
  ProductoSnapshotStruct? productoSnapshot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productoSnapshot == null) {
    return;
  }
  if (productoSnapshot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productoSnapshot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productoSnapshotData =
      getProductoSnapshotFirestoreData(productoSnapshot, forFieldValue);
  final nestedData =
      productoSnapshotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productoSnapshot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductoSnapshotFirestoreData(
  ProductoSnapshotStruct? productoSnapshot, [
  bool forFieldValue = false,
]) {
  if (productoSnapshot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productoSnapshot.toMap());

  // Add any Firestore field values
  mapToFirestore(productoSnapshot.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductoSnapshotListFirestoreData(
  List<ProductoSnapshotStruct>? productoSnapshots,
) =>
    productoSnapshots
        ?.map((e) => getProductoSnapshotFirestoreData(e, true))
        .toList() ??
    [];
