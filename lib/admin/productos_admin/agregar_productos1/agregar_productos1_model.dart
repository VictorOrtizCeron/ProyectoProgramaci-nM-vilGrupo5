import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'agregar_productos1_widget.dart' show AgregarProductos1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarProductos1Model extends FlutterFlowModel<AgregarProductos1Widget> {
  ///  Local state fields for this page.

  bool imagenactiva = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_uploadDataTps = false;
  FFUploadedFile uploadedLocalFile_uploadDataTps =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTps = '';

  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // State field(s) for txtDescripcion widget.
  FocusNode? txtDescripcionFocusNode;
  TextEditingController? txtDescripcionTextController;
  String? Function(BuildContext, String?)?
      txtDescripcionTextControllerValidator;
  // State field(s) for DropDownCategorias widget.
  String? dropDownCategoriasValue;
  FormFieldController<String>? dropDownCategoriasValueController;
  // State field(s) for txtStock widget.
  FocusNode? txtStockFocusNode;
  TextEditingController? txtStockTextController;
  String? Function(BuildContext, String?)? txtStockTextControllerValidator;
  // State field(s) for txtStockMin widget.
  FocusNode? txtStockMinFocusNode;
  TextEditingController? txtStockMinTextController;
  String? Function(BuildContext, String?)? txtStockMinTextControllerValidator;
  // State field(s) for txtPrecio widget.
  FocusNode? txtPrecioFocusNode;
  TextEditingController? txtPrecioTextController;
  String? Function(BuildContext, String?)? txtPrecioTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductoRecord? productocreado;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtDescripcionFocusNode?.dispose();
    txtDescripcionTextController?.dispose();

    txtStockFocusNode?.dispose();
    txtStockTextController?.dispose();

    txtStockMinFocusNode?.dispose();
    txtStockMinTextController?.dispose();

    txtPrecioFocusNode?.dispose();
    txtPrecioTextController?.dispose();
  }
}
