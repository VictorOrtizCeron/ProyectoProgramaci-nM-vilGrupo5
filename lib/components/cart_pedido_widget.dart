import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_pedido_model.dart';
export 'cart_pedido_model.dart';

class CartPedidoWidget extends StatefulWidget {
  const CartPedidoWidget({
    super.key,
    this.orderDoc,
    this.parameter2,
  });

  final PedidoRecord? orderDoc;
  final DocumentReference? parameter2;

  @override
  State<CartPedidoWidget> createState() => _CartPedidoWidgetState();
}

class _CartPedidoWidgetState extends State<CartPedidoWidget> {
  late CartPedidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPedidoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: StreamBuilder<UsuariosRecord>(
        stream: UsuariosRecord.getDocument(widget!.parameter2!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            );
          }

          final dropDownUsuariosRecord = snapshot.data!;

          return FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(
              _model.dropDownValue ??= valueOrDefault<String>(
                dropDownUsuariosRecord.roles,
                'Error roles',
              ),
            ),
            options: [
              valueOrDefault<String>(
                EstadoPedidos.Recibido.name,
                'Error recibido',
              ),
              valueOrDefault<String>(
                EstadoPedidos.En_Preparacion.name,
                'Error En prepa',
              ),
              valueOrDefault<String>(
                EstadoPedidos.Pendiente.name,
                'Error Pendiente',
              )
            ],
            onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
            width: 140.0,
            height: 32.0,
            textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
            hintText: FFLocalizations.of(context).getText(
              'jk04q3jc' /* Cambiar estado */,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 16.0,
            ),
            fillColor: FlutterFlowTheme.of(context).primary,
            elevation: 0.0,
            borderColor: Colors.transparent,
            borderWidth: 0.0,
            borderRadius: 16.0,
            margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            hidesUnderline: true,
            isOverButton: false,
            isSearchable: false,
            isMultiSelect: false,
          );
        },
      ),
    );
  }
}
