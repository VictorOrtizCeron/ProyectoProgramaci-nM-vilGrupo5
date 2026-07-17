import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/new_password_modal/new_password_modal_widget.dart';
import '/components/ubicacion_modal/ubicacion_modal_widget.dart';
import '/components/usuario_actualizado/usuario_actualizado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'perfil_repartidor_widget.dart' show PerfilRepartidorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilRepartidorModel extends FlutterFlowModel<PerfilRepartidorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  bool isDataUploading_uploadDataU72 = false;
  FFUploadedFile uploadedLocalFile_uploadDataU72 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataU72 = '';

  // State field(s) for TextFieldNombre widget.
  FocusNode? textFieldNombreFocusNode;
  TextEditingController? textFieldNombreTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreTextControllerValidator;
  // State field(s) for TextFieldCorreo widget.
  FocusNode? textFieldCorreoFocusNode;
  TextEditingController? textFieldCorreoTextController;
  String? Function(BuildContext, String?)?
      textFieldCorreoTextControllerValidator;
  // State field(s) for TextFieldNumTel widget.
  FocusNode? textFieldNumTelFocusNode;
  TextEditingController? textFieldNumTelTextController;
  String? Function(BuildContext, String?)?
      textFieldNumTelTextControllerValidator;
  // State field(s) for TextFieldDireccion widget.
  FocusNode? textFieldDireccionFocusNode;
  TextEditingController? textFieldDireccionTextController;
  String? Function(BuildContext, String?)?
      textFieldDireccionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    textFieldNombreFocusNode?.dispose();
    textFieldNombreTextController?.dispose();

    textFieldCorreoFocusNode?.dispose();
    textFieldCorreoTextController?.dispose();

    textFieldNumTelFocusNode?.dispose();
    textFieldNumTelTextController?.dispose();

    textFieldDireccionFocusNode?.dispose();
    textFieldDireccionTextController?.dispose();
  }
}
