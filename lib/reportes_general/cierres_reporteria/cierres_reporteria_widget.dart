import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cierres_reporteria_model.dart';
export 'cierres_reporteria_model.dart';

class CierresReporteriaWidget extends StatefulWidget {
  const CierresReporteriaWidget({super.key});

  static String routeName = 'CierresReporteria';
  static String routePath = '/cierresReporteria';

  @override
  State<CierresReporteriaWidget> createState() =>
      _CierresReporteriaWidgetState();
}

class _CierresReporteriaWidgetState extends State<CierresReporteriaWidget>
    with TickerProviderStateMixin {
  late CierresReporteriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CierresReporteriaModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VentaRecord>>(
      stream: queryVentaRecord(
        queryBuilder: (ventaRecord) => ventaRecord
            .where(
              'Vent_Fecha_Hora',
              isGreaterThanOrEqualTo: _model.fechaInicio,
            )
            .where(
              'Vent_Fecha_Hora',
              isLessThanOrEqualTo: _model.fechaFin,
            )
            .orderBy('Vent_Fecha_Hora', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF7F5F1),
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<VentaRecord> cierresReporteriaVentaRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF7F5F1),
            drawer: Drawer(
              elevation: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'o6gpf4ct' /* Categoría */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(InventarioReporteriaWidget.routeName);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'br7tekne' /* Inventario */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(CierresReporteriaWidget.routeName);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'yrr1bgs1' /* Cierres */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AuditoriasReporteriaWidget.routeName);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'q0shpqzm' /* Auditorias */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFFF7F5F1),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.dehaze,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'erjvx36m' /* Cierres */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF040404),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context
                                  .pushNamed(AdminMenuInicialWidget.routeName);
                            },
                            text: FFLocalizations.of(context).getText(
                              'yf24lmq0' /* Volver */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFE5E5E5),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFABABAB),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2ncqjmxx' /* Seleccionar fecha */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 5.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final _datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .headlineLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );

                                if (_datePicked1Date != null) {
                                  safeSetState(() {
                                    _model.datePicked1 = DateTime(
                                      _datePicked1Date.year,
                                      _datePicked1Date.month,
                                      _datePicked1Date.day,
                                    );
                                  });
                                } else if (_model.datePicked1 != null) {
                                  safeSetState(() {
                                    _model.datePicked1 = getCurrentTimestamp;
                                  });
                                }
                                _model.fechaInicio = _model.datePicked1;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '87vsneuc' /* Fecha Inicial */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final _datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .headlineLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );

                                if (_datePicked2Date != null) {
                                  safeSetState(() {
                                    _model.datePicked2 = DateTime(
                                      _datePicked2Date.year,
                                      _datePicked2Date.month,
                                      _datePicked2Date.day,
                                    );
                                  });
                                } else if (_model.datePicked2 != null) {
                                  safeSetState(() {
                                    _model.datePicked2 = getCurrentTimestamp;
                                  });
                                }
                                _model.fechaFin = _model.datePicked2;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'slo8y5p8' /* Fecha Final */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'mhvfu76m' /* Elementos:  */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              cierresReporteriaVentaRecordList.length
                                  .toString(),
                              'Items Error',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'ycw62ri5' /* Detalles */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'ez92ccp6' /* Cantidades */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.53,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final rellenoCierre =
                                              cierresReporteriaVentaRecordList
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: rellenoCierre.length,
                                            itemBuilder:
                                                (context, rellenoCierreIndex) {
                                              final rellenoCierreItem =
                                                  rellenoCierre[
                                                      rellenoCierreIndex];
                                              return StreamBuilder<
                                                  CarritoRecord>(
                                                stream:
                                                    CarritoRecord.getDocument(
                                                        rellenoCierreItem
                                                            .carritoRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child:
                                                            SpinKitFadingGrid(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final containerCarritoRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.1,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0xFFFFCFBB),
                                                                Color(
                                                                    0xFFF9B49A)
                                                              ],
                                                              stops: [0.0, 1.0],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1.0),
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                rellenoCierreIndex
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.25,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'h6639rrp' /* Fecha */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      "d/M/yyyy",
                                                                      rellenoCierreItem
                                                                          .ventFechaHora,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Fecha Error',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            ProductoRecord>(
                                                          stream: ProductoRecord
                                                              .getDocument(
                                                                  containerCarritoRecord
                                                                      .producto!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      SpinKitFadingGrid(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final containerProductoRecord =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.4,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ug6ncxvc' /* Producto */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerProductoRecord
                                                                            .proNombre,
                                                                        'Producto Error',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.25,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '2be7q4s6' /* Metodo de Pago */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rellenoCierreItem
                                                                        .metodoPago,
                                                                    'Metodo Error',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.53,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final rellenoInventario =
                                              cierresReporteriaVentaRecordList
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: rellenoInventario.length,
                                            itemBuilder: (context,
                                                rellenoInventarioIndex) {
                                              final rellenoInventarioItem =
                                                  rellenoInventario[
                                                      rellenoInventarioIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.1,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFFFCFBB),
                                                            Color(0xFFF9B49A)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            rellenoInventarioIndex
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.4,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ky3r9erd' /* Descuento */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                rellenoInventarioItem
                                                                    .ventDescuento
                                                                    .toString(),
                                                                'Sin Descuento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dm4sv27b' /* Total */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  rellenoInventarioItem
                                                                      .ventTotal,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                  currency: '₡',
                                                                ),
                                                                'Total Error',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 3.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'oevpuwa9' /* Total fechas seleccionadas: */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  functions
                                      .sumTotal(cierresReporteriaVentaRecordList
                                          .map((e) => valueOrDefault<double>(
                                                e.ventTotal,
                                                0.0,
                                              ))
                                          .toList()),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: '₡',
                                ),
                                'Total Error',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
