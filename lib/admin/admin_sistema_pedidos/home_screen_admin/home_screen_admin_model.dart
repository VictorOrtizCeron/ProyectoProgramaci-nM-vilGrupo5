import '/admin/admin_components/slibar_admin/slibar_admin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'home_screen_admin_widget.dart' show HomeScreenAdminWidget;
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomeScreenAdminModel extends FlutterFlowModel<HomeScreenAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SlibarAdmin component.
  late SlibarAdminModel slibarAdminModel;
  // State field(s) for ColumnaDinamica widget.
  ScrollController? columnaDinamicaScrollController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductoRecord> simpleSearchResults = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ColumnaProductos widget.
  ScrollController? columnaProductosScrollController;

  @override
  void initState(BuildContext context) {
    slibarAdminModel = createModel(context, () => SlibarAdminModel());
    columnaDinamicaScrollController = ScrollController();
    columnaProductosScrollController = ScrollController();
  }

  @override
  void dispose() {
    slibarAdminModel.dispose();
    columnaDinamicaScrollController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    columnaProductosScrollController?.dispose();
  }
}
