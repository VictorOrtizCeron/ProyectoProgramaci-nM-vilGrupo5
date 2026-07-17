import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cierres_reporteria_widget.dart' show CierresReporteriaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CierresReporteriaModel extends FlutterFlowModel<CierresReporteriaWidget> {
  ///  Local state fields for this page.

  DateTime? fechaInicio;

  DateTime? fechaFin;

  List<DocumentReference> cierreCarrito = [];
  void addToCierreCarrito(DocumentReference item) => cierreCarrito.add(item);
  void removeFromCierreCarrito(DocumentReference item) =>
      cierreCarrito.remove(item);
  void removeAtIndexFromCierreCarrito(int index) =>
      cierreCarrito.removeAt(index);
  void insertAtIndexInCierreCarrito(int index, DocumentReference item) =>
      cierreCarrito.insert(index, item);
  void updateCierreCarritoAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      cierreCarrito[index] = updateFn(cierreCarrito[index]);

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
