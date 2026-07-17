import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future<String> obtenerNombreUbicacion(BuildContext context) async {
  ApiCallResponse? apiResultado;

  if (currentUserDocument?.ubicacionMaps != null) {
    apiResultado = await GoogleMapsGeocodingConvertCall.call(
      lat: functions.getLat(currentUserDocument?.ubicacionMaps),
      lng: functions.getLng(currentUserDocument?.ubicacionMaps),
    );

    if ((apiResultado?.succeeded ?? true)) {
      return functions.getShortAddress((apiResultado?.jsonBody ?? ''))!;
    }

    return 'Error de Conexion';
  } else {
    return 'Actualizar Direccion';
  }
}
