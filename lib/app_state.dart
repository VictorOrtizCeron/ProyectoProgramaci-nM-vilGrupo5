import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartCounter = prefs.getInt('ff_cartCounter') ?? _cartCounter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _selected = false;
  bool get selected => _selected;
  set selected(bool value) {
    _selected = value;
  }

  int _cartCounter = 0;
  int get cartCounter => _cartCounter;
  set cartCounter(int value) {
    _cartCounter = value;
    prefs.setInt('ff_cartCounter', value);
  }

  Color _TemaColor = Color(4294967295);
  Color get TemaColor => _TemaColor;
  set TemaColor(Color value) {
    _TemaColor = value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  String _searchNumber = 'Todos los Platillos';
  String get searchNumber => _searchNumber;
  set searchNumber(String value) {
    _searchNumber = value;
  }

  bool _cierreActivo = false;
  bool get cierreActivo => _cierreActivo;
  set cierreActivo(bool value) {
    _cierreActivo = value;
  }

  String _idCierreActual = '';
  String get idCierreActual => _idCierreActual;
  set idCierreActual(String value) {
    _idCierreActual = value;
  }

  int _registrarCantidadInv = 0;
  int get registrarCantidadInv => _registrarCantidadInv;
  set registrarCantidadInv(int value) {
    _registrarCantidadInv = value;
  }

  DocumentReference? _mainuser =
      FirebaseFirestore.instance.doc('/USUARIOS/S2h5o1V0cWUomLw1zpQLI8W9wTI2');
  DocumentReference? get mainuser => _mainuser;
  set mainuser(DocumentReference? value) {
    _mainuser = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
