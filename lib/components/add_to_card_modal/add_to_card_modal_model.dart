import '/components/add_extra_item/add_extra_item_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_to_card_modal_widget.dart' show AddToCardModalWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToCardModalModel extends FlutterFlowModel<AddToCardModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // Model for AddExtraItem component.
  late AddExtraItemModel addExtraItemModel;
  // State field(s) for CountController widget.
  int? countControllerValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    addExtraItemModel = createModel(context, () => AddExtraItemModel());
  }

  @override
  void dispose() {
    addExtraItemModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
