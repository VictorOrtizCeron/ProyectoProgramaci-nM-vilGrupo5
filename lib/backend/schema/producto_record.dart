import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductoRecord extends FirestoreRecord {
  ProductoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Pro_nombre" field.
  String? _proNombre;
  String get proNombre => _proNombre ?? '';
  bool hasProNombre() => _proNombre != null;

  // "Pro_descripcion" field.
  String? _proDescripcion;
  String get proDescripcion => _proDescripcion ?? '';
  bool hasProDescripcion() => _proDescripcion != null;

  // "Pro_precio" field.
  double? _proPrecio;
  double get proPrecio => _proPrecio ?? 0.0;
  bool hasProPrecio() => _proPrecio != null;

  // "Pro_stock_actual" field.
  int? _proStockActual;
  int get proStockActual => _proStockActual ?? 0;
  bool hasProStockActual() => _proStockActual != null;

  // "Pro_stock_minimo" field.
  int? _proStockMinimo;
  int get proStockMinimo => _proStockMinimo ?? 0;
  bool hasProStockMinimo() => _proStockMinimo != null;

  // "Pro_foto_url" field.
  String? _proFotoUrl;
  String get proFotoUrl => _proFotoUrl ?? '';
  bool hasProFotoUrl() => _proFotoUrl != null;

  // "Pro_activo" field.
  bool? _proActivo;
  bool get proActivo => _proActivo ?? false;
  bool hasProActivo() => _proActivo != null;

  // "carrito" field.
  DocumentReference? _carrito;
  DocumentReference? get carrito => _carrito;
  bool hasCarrito() => _carrito != null;

  // "creadopor" field.
  DocumentReference? _creadopor;
  DocumentReference? get creadopor => _creadopor;
  bool hasCreadopor() => _creadopor != null;

  // "editadopor" field.
  DocumentReference? _editadopor;
  DocumentReference? get editadopor => _editadopor;
  bool hasEditadopor() => _editadopor != null;

  // "creadotiempo" field.
  DateTime? _creadotiempo;
  DateTime? get creadotiempo => _creadotiempo;
  bool hasCreadotiempo() => _creadotiempo != null;

  // "editadotiempo" field.
  DateTime? _editadotiempo;
  DateTime? get editadotiempo => _editadotiempo;
  bool hasEditadotiempo() => _editadotiempo != null;

  // "accion" field.
  String? _accion;
  String get accion => _accion ?? '';
  bool hasAccion() => _accion != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "auditoria" field.
  DocumentReference? _auditoria;
  DocumentReference? get auditoria => _auditoria;
  bool hasAuditoria() => _auditoria != null;

  // "inactivadopor" field.
  DocumentReference? _inactivadopor;
  DocumentReference? get inactivadopor => _inactivadopor;
  bool hasInactivadopor() => _inactivadopor != null;

  // "inactivadotiempo" field.
  DateTime? _inactivadotiempo;
  DateTime? get inactivadotiempo => _inactivadotiempo;
  bool hasInactivadotiempo() => _inactivadotiempo != null;

  // "inventarioref" field.
  DocumentReference? _inventarioref;
  DocumentReference? get inventarioref => _inventarioref;
  bool hasInventarioref() => _inventarioref != null;

  void _initializeFields() {
    _proNombre = snapshotData['Pro_nombre'] as String?;
    _proDescripcion = snapshotData['Pro_descripcion'] as String?;
    _proPrecio = castToType<double>(snapshotData['Pro_precio']);
    _proStockActual = castToType<int>(snapshotData['Pro_stock_actual']);
    _proStockMinimo = castToType<int>(snapshotData['Pro_stock_minimo']);
    _proFotoUrl = snapshotData['Pro_foto_url'] as String?;
    _proActivo = snapshotData['Pro_activo'] as bool?;
    _carrito = snapshotData['carrito'] as DocumentReference?;
    _creadopor = snapshotData['creadopor'] as DocumentReference?;
    _editadopor = snapshotData['editadopor'] as DocumentReference?;
    _creadotiempo = snapshotData['creadotiempo'] as DateTime?;
    _editadotiempo = snapshotData['editadotiempo'] as DateTime?;
    _accion = snapshotData['accion'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _auditoria = snapshotData['auditoria'] as DocumentReference?;
    _inactivadopor = snapshotData['inactivadopor'] as DocumentReference?;
    _inactivadotiempo = snapshotData['inactivadotiempo'] as DateTime?;
    _inventarioref = snapshotData['inventarioref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PRODUCTO');

  static Stream<ProductoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductoRecord.fromSnapshot(s));

  static Future<ProductoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductoRecord.fromSnapshot(s));

  static ProductoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductoRecordData({
  String? proNombre,
  String? proDescripcion,
  double? proPrecio,
  int? proStockActual,
  int? proStockMinimo,
  String? proFotoUrl,
  bool? proActivo,
  DocumentReference? carrito,
  DocumentReference? creadopor,
  DocumentReference? editadopor,
  DateTime? creadotiempo,
  DateTime? editadotiempo,
  String? accion,
  String? categoria,
  DocumentReference? auditoria,
  DocumentReference? inactivadopor,
  DateTime? inactivadotiempo,
  DocumentReference? inventarioref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Pro_nombre': proNombre,
      'Pro_descripcion': proDescripcion,
      'Pro_precio': proPrecio,
      'Pro_stock_actual': proStockActual,
      'Pro_stock_minimo': proStockMinimo,
      'Pro_foto_url': proFotoUrl,
      'Pro_activo': proActivo,
      'carrito': carrito,
      'creadopor': creadopor,
      'editadopor': editadopor,
      'creadotiempo': creadotiempo,
      'editadotiempo': editadotiempo,
      'accion': accion,
      'categoria': categoria,
      'auditoria': auditoria,
      'inactivadopor': inactivadopor,
      'inactivadotiempo': inactivadotiempo,
      'inventarioref': inventarioref,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductoRecordDocumentEquality implements Equality<ProductoRecord> {
  const ProductoRecordDocumentEquality();

  @override
  bool equals(ProductoRecord? e1, ProductoRecord? e2) {
    return e1?.proNombre == e2?.proNombre &&
        e1?.proDescripcion == e2?.proDescripcion &&
        e1?.proPrecio == e2?.proPrecio &&
        e1?.proStockActual == e2?.proStockActual &&
        e1?.proStockMinimo == e2?.proStockMinimo &&
        e1?.proFotoUrl == e2?.proFotoUrl &&
        e1?.proActivo == e2?.proActivo &&
        e1?.carrito == e2?.carrito &&
        e1?.creadopor == e2?.creadopor &&
        e1?.editadopor == e2?.editadopor &&
        e1?.creadotiempo == e2?.creadotiempo &&
        e1?.editadotiempo == e2?.editadotiempo &&
        e1?.accion == e2?.accion &&
        e1?.categoria == e2?.categoria &&
        e1?.auditoria == e2?.auditoria &&
        e1?.inactivadopor == e2?.inactivadopor &&
        e1?.inactivadotiempo == e2?.inactivadotiempo &&
        e1?.inventarioref == e2?.inventarioref;
  }

  @override
  int hash(ProductoRecord? e) => const ListEquality().hash([
        e?.proNombre,
        e?.proDescripcion,
        e?.proPrecio,
        e?.proStockActual,
        e?.proStockMinimo,
        e?.proFotoUrl,
        e?.proActivo,
        e?.carrito,
        e?.creadopor,
        e?.editadopor,
        e?.creadotiempo,
        e?.editadotiempo,
        e?.accion,
        e?.categoria,
        e?.auditoria,
        e?.inactivadopor,
        e?.inactivadotiempo,
        e?.inventarioref
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductoRecord;
}
