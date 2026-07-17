import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/log_out_modal/log_out_modal_widget.dart';
import '/components/ubicacion_modal/ubicacion_modal_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sistema_pedidos/slibar/slibar_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'home_screen_user_widget.dart' show HomeScreenUserWidget;
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomeScreenUserModel extends FlutterFlowModel<HomeScreenUserWidget> {
  ///  Local state fields for this page.

  String direccionActual = 'Actualizar dirección';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - ObtenerNombreUbicacion] action in HomeScreenUser widget.
  String? textoUbicacion;
  // Model for Slibar component.
  late SlibarModel slibarModel;
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
    slibarModel = createModel(context, () => SlibarModel());
    columnaDinamicaScrollController = ScrollController();
    columnaProductosScrollController = ScrollController();
  }

  @override
  void dispose() {
    slibarModel.dispose();
    columnaDinamicaScrollController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    columnaProductosScrollController?.dispose();
  }
}
