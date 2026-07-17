import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'new_password_modal_widget.dart' show NewPasswordModalWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewPasswordModalModel extends FlutterFlowModel<NewPasswordModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NewUserPassword widget.
  FocusNode? newUserPasswordFocusNode;
  TextEditingController? newUserPasswordTextController;
  late bool newUserPasswordVisibility;
  String? Function(BuildContext, String?)?
      newUserPasswordTextControllerValidator;
  // State field(s) for PaswordConfirm widget.
  FocusNode? paswordConfirmFocusNode;
  TextEditingController? paswordConfirmTextController;
  late bool paswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      paswordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newUserPasswordVisibility = false;
    paswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    newUserPasswordFocusNode?.dispose();
    newUserPasswordTextController?.dispose();

    paswordConfirmFocusNode?.dispose();
    paswordConfirmTextController?.dispose();
  }
}
