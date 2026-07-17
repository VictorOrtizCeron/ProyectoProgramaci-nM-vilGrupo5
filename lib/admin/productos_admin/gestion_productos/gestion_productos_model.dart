import '/admin/admin_components/slibar_admin/slibar_admin_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'gestion_productos_widget.dart' show GestionProductosWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GestionProductosModel extends FlutterFlowModel<GestionProductosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SlibarAdmin component.
  late SlibarAdminModel slibarAdminModel;

  @override
  void initState(BuildContext context) {
    slibarAdminModel = createModel(context, () => SlibarAdminModel());
  }

  @override
  void dispose() {
    slibarAdminModel.dispose();
  }
}
