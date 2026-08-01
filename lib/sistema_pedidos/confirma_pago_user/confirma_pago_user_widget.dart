import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirma_pago_user_model.dart';
export 'confirma_pago_user_model.dart';

class ConfirmaPagoUserWidget extends StatefulWidget {
  const ConfirmaPagoUserWidget({super.key});

  static String routeName = 'ConfirmaPagoUser';
  static String routePath = '/confirmaPagoUser';

  @override
  State<ConfirmaPagoUserWidget> createState() => _ConfirmaPagoUserWidgetState();
}

class _ConfirmaPagoUserWidgetState extends State<ConfirmaPagoUserWidget> {
  late ConfirmaPagoUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmaPagoUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '44t7jk1j' /* Confirmación de Pedido */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: StreamBuilder<List<CarritoRecord>>(
              stream: queryCarritoRecord(
                singleRecord: true,
              ),
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
                List<CarritoRecord> columnCarritoRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnCarritoRecord = columnCarritoRecordList.isNotEmpty
                    ? columnCarritoRecordList.first
                    : null;

                return SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFF108BE8),
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'tttr81eq' /* Artículos en tu carrito: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder<int>(
                                  future: queryCarritoRecordCount(
                                    queryBuilder: (carritoRecord) =>
                                        carritoRecord.where(
                                      'estado',
                                      isEqualTo: 'pendiente',
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: SpinKitFadingGrid(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    int textCount = snapshot.data!;

                                    return Text(
                                      valueOrDefault<String>(
                                        textCount.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '2ooid5en' /* Método de pago */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowRadioButton(
                                options: [
                                  valueOrDefault<String>(
                                    MetodosdePago.SinpeMovil.name,
                                    'Sinpe Movil',
                                  ),
                                  valueOrDefault<String>(
                                    MetodosdePago.Datafono.name,
                                    'Datafono',
                                  ),
                                  valueOrDefault<String>(
                                    MetodosdePago.Efectivo.name,
                                    'Efectivo',
                                  )
                                ].toList(),
                                onChanged: (val) => safeSetState(() {}),
                                controller:
                                    _model.radioButtonValueController ??=
                                        FormFieldController<String>(null),
                                optionHeight: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.vertical,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'jz4dw8xz' /* Resumen de orden */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'hbnztxtc' /* Subtotal */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        StreamBuilder<List<CarritoRecord>>(
                                          stream: queryCarritoRecord(
                                            queryBuilder: (carritoRecord) =>
                                                carritoRecord.where(
                                              'estado',
                                              isEqualTo: 'pendiente',
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CarritoRecord>
                                                textCarritoRecordList =
                                                snapshot.data!;

                                            return Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .getSubtotal(
                                                        textCarritoRecordList
                                                            .map((e) =>
                                                                e.subtotal)
                                                            .toList(),
                                                        textCarritoRecordList
                                                            .map((e) =>
                                                                e.cantidad)
                                                            .toList())
                                                    .toString(),
                                                '₡0.0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'nbzlr15d' /* Impuesto (13%) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        StreamBuilder<List<CarritoRecord>>(
                                          stream: queryCarritoRecord(
                                            queryBuilder: (carritoRecord) =>
                                                carritoRecord.where(
                                              'estado',
                                              isEqualTo: 'pendiente',
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CarritoRecord>
                                                textCarritoRecordList =
                                                snapshot.data!;

                                            return Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  functions.agregarImpuesto(
                                                      textCarritoRecordList
                                                          .map(
                                                              (e) => e.subtotal)
                                                          .toList(),
                                                      textCarritoRecordList
                                                          .map(
                                                              (e) => e.cantidad)
                                                          .toList()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '₡',
                                                ),
                                                '₡0.0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'iex6nyxp' /* Total */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        StreamBuilder<List<CarritoRecord>>(
                                          stream: queryCarritoRecord(
                                            queryBuilder: (carritoRecord) =>
                                                carritoRecord.where(
                                              'estado',
                                              isEqualTo: 'pendiente',
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CarritoRecord>
                                                textCarritoRecordList =
                                                snapshot.data!;

                                            return Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  functions.totalDescSub(
                                                      textCarritoRecordList
                                                          .map(
                                                              (e) => e.subtotal)
                                                          .toList(),
                                                      0.0,
                                                      textCarritoRecordList
                                                          .map(
                                                              (e) => e.cantidad)
                                                          .toList()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '₡',
                                                ),
                                                '₡0.0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                      StreamBuilder<List<UsuariosRecord>>(
                        stream: queryUsuariosRecord(
                          queryBuilder: (usuariosRecord) =>
                              usuariosRecord.where(
                            'email',
                            isEqualTo: currentUserEmail,
                          ),
                          singleRecord: true,
                        ),
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
                          List<UsuariosRecord> rowUsuariosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final rowUsuariosRecord =
                              rowUsuariosRecordList.isNotEmpty
                                  ? rowUsuariosRecordList.first
                                  : null;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        UserCartOficialWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ib41ry7h' /* Volver al Carrito */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 52.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: StreamBuilder<List<CarritoRecord>>(
                                  stream: queryCarritoRecord(
                                    queryBuilder: (carritoRecord) =>
                                        carritoRecord.where(
                                      'estado',
                                      isEqualTo: 'pendiente',
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: SpinKitFadingGrid(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CarritoRecord>
                                        confirmarOrdenCarritoRecordList =
                                        snapshot.data!;

                                    return FFButtonWidget(
                                      onPressed: () async {
                                        _model.numPedidoUnico =
                                            'ORD-${dateTimeFormat(
                                          "yyyyMMdd",
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}-${random_data.randomInteger(1000, 9999).toString()}';
                                        safeSetState(() {});
                                        for (int loop1Index = 0;
                                            loop1Index <
                                                confirmarOrdenCarritoRecordList
                                                    .length;
                                            loop1Index++) {
                                          final currentLoop1Item =
                                              confirmarOrdenCarritoRecordList[
                                                  loop1Index];

                                          await currentLoop1Item.reference
                                              .update(createCarritoRecordData(
                                            estado: 'completado',
                                            fechaEstado: getCurrentTimestamp,
                                            numPedidoRef: _model.numPedidoUnico,
                                          ));

                                          await currentLoop1Item.producto!
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'Pro_stock_actual':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });
                                        }

                                        var pedidoRecordReference =
                                            PedidoRecord.collection.doc();
                                        await pedidoRecordReference
                                            .set(createPedidoRecordData(
                                          pedEstado: EstadoPedidos.Recibido,
                                          pedFechaHora: getCurrentTimestamp,
                                          pedSubTotal:
                                              columnCarritoRecord?.subtotal,
                                          pedDireccionEnvio:
                                              rowUsuariosRecord?.ubicacionMaps,
                                          clienteRef:
                                              columnCarritoRecord?.clienteRef,
                                          pedTotal: functions.totalDescSub(
                                              confirmarOrdenCarritoRecordList
                                                  .map((e) => e.subtotal)
                                                  .toList(),
                                              0.0,
                                              confirmarOrdenCarritoRecordList
                                                  .map((e) => e.cantidad)
                                                  .toList()),
                                          repartidorRef: currentUserReference,
                                          carritoRef:
                                              columnCarritoRecord?.reference,
                                          productoRed:
                                              columnCarritoRecord?.producto,
                                          metodoPago: _model.radioButtonValue,
                                          numPedidoRef: _model.numPedidoUnico,
                                        ));
                                        _model.pedidoRef =
                                            PedidoRecord.getDocumentFromData(
                                                createPedidoRecordData(
                                                  pedEstado:
                                                      EstadoPedidos.Recibido,
                                                  pedFechaHora:
                                                      getCurrentTimestamp,
                                                  pedSubTotal:
                                                      columnCarritoRecord
                                                          ?.subtotal,
                                                  pedDireccionEnvio:
                                                      rowUsuariosRecord
                                                          ?.ubicacionMaps,
                                                  clienteRef:
                                                      columnCarritoRecord
                                                          ?.clienteRef,
                                                  pedTotal: functions.totalDescSub(
                                                      confirmarOrdenCarritoRecordList
                                                          .map(
                                                              (e) => e.subtotal)
                                                          .toList(),
                                                      0.0,
                                                      confirmarOrdenCarritoRecordList
                                                          .map(
                                                              (e) => e.cantidad)
                                                          .toList()),
                                                  repartidorRef:
                                                      currentUserReference,
                                                  carritoRef:
                                                      columnCarritoRecord
                                                          ?.reference,
                                                  productoRed:
                                                      columnCarritoRecord
                                                          ?.producto,
                                                  metodoPago:
                                                      _model.radioButtonValue,
                                                  numPedidoRef:
                                                      _model.numPedidoUnico,
                                                ),
                                                pedidoRecordReference);

                                        var ventaRecordReference =
                                            VentaRecord.collection.doc();
                                        await ventaRecordReference
                                            .set(createVentaRecordData(
                                          ventFechaHora: getCurrentTimestamp,
                                          ventTotal: functions.totalDescSub(
                                              confirmarOrdenCarritoRecordList
                                                  .map((e) => e.subtotal)
                                                  .toList(),
                                              0.0,
                                              confirmarOrdenCarritoRecordList
                                                  .map((e) => e.cantidad)
                                                  .toList()),
                                          ventEstado: EstadoVentas.Completada,
                                          fechaCreacion: getCurrentTimestamp,
                                          ventDescuento: 0.0,
                                          usuarioRef:
                                              columnCarritoRecord?.clienteRef,
                                          metodoPago: _model.radioButtonValue,
                                          carritoRef:
                                              columnCarritoRecord?.reference,
                                          creadoPor:
                                              columnCarritoRecord?.clienteRef,
                                        ));
                                        _model.newVentaRef =
                                            VentaRecord.getDocumentFromData(
                                                createVentaRecordData(
                                                  ventFechaHora:
                                                      getCurrentTimestamp,
                                                  ventTotal: functions.totalDescSub(
                                                      confirmarOrdenCarritoRecordList
                                                          .map(
                                                              (e) => e.subtotal)
                                                          .toList(),
                                                      0.0,
                                                      confirmarOrdenCarritoRecordList
                                                          .map(
                                                              (e) => e.cantidad)
                                                          .toList()),
                                                  ventEstado:
                                                      EstadoVentas.Completada,
                                                  fechaCreacion:
                                                      getCurrentTimestamp,
                                                  ventDescuento: 0.0,
                                                  usuarioRef:
                                                      columnCarritoRecord
                                                          ?.clienteRef,
                                                  metodoPago:
                                                      _model.radioButtonValue,
                                                  carritoRef:
                                                      columnCarritoRecord
                                                          ?.reference,
                                                  creadoPor: columnCarritoRecord
                                                      ?.clienteRef,
                                                ),
                                                ventaRecordReference);

                                        context.pushNamed(
                                          ResumenOrdenUserWidget.routeName,
                                          queryParameters: {
                                            'ordenRef': serializeParam(
                                              _model.pedidoRef?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '51znp1hk' /* Confirmar Orden */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 52.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF108BE8),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 32.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
