import '/components/button_order_status/button_order_status_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'my_order_item_widget.dart' show MyOrderItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyOrderItemModel extends FlutterFlowModel<MyOrderItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ButtonOrderStatus component.
  late ButtonOrderStatusModel buttonOrderStatusModel;

  @override
  void initState(BuildContext context) {
    buttonOrderStatusModel =
        createModel(context, () => ButtonOrderStatusModel());
  }

  @override
  void dispose() {
    buttonOrderStatusModel.dispose();
  }
}
