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
import '/actions/actions.dart' as action_blocks;
import 'perfil_user_widget.dart' show PerfilUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilUserModel extends FlutterFlowModel<PerfilUserWidget> {
  ///  Local state fields for this page.

  bool imagenactiva = false;

  String direccionObtener = 'Actualiza tu Ubicacion aca!';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Action Block - ObtenerNombreUbicacion] action in PerfilUser widget.
  String? ubicacionReal;
  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_uploadDataU75 = false;
  FFUploadedFile uploadedLocalFile_uploadDataU75 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataU75 = '';

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
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
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
