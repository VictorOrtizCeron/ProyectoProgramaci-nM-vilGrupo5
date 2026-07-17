import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sistema_pedidos/slibar/slibar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'user_cart_oficial_widget.dart' show UserCartOficialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserCartOficialModel extends FlutterFlowModel<UserCartOficialWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for Slibar component.
  late SlibarModel slibarModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    slibarModel = createModel(context, () => SlibarModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    slibarModel.dispose();
  }
}
