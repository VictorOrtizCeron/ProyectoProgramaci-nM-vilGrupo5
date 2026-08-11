import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/button_order_status/button_order_status_widget.dart';
import '/components/my_order_item/my_order_item_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sistema_pedidos/listade_productos_historial/listade_productos_historial_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historial_pedidos_copy_model.dart';
export 'historial_pedidos_copy_model.dart';

class HistorialPedidosCopyWidget extends StatefulWidget {
  const HistorialPedidosCopyWidget({super.key});

  static String routeName = 'HistorialPedidosCopy';
  static String routePath = '/historialPedidosCopy';

  @override
  State<HistorialPedidosCopyWidget> createState() =>
      _HistorialPedidosCopyWidgetState();
}

class _HistorialPedidosCopyWidgetState extends State<HistorialPedidosCopyWidget>
    with TickerProviderStateMixin {
  late HistorialPedidosCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialPedidosCopyModel());

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F5F1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F5F1),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(),
                              ),
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ldbmk8td' /* Mis ordenes */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 60.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    FFIcons.karrowNarrowLeft,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                        HomeScreenUserWidget.routeName);
                                  },
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                        unselectedLabelStyle: TextStyle(),
                                        labelColor:
                                            FlutterFlowTheme.of(context).white,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        unselectedBackgroundColor:
                                            FlutterFlowTheme.of(context).white,
                                        unselectedBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 12.0,
                                        elevation: 0.0,
                                        buttonMargin:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        padding: EdgeInsets.all(4.0),
                                        tabs: [
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'y2567ilu' /* Mi orden */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'hutw57a7' /* Historial */,
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
                                          StreamBuilder<List<PedidoRecord>>(
                                            stream: queryPedidoRecord(
                                              queryBuilder: (pedidoRecord) =>
                                                  pedidoRecord
                                                      .where(Filter.or(
                                                        Filter(
                                                          'Cliente_Ref',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                        Filter(
                                                          'Ped_Estado',
                                                          isEqualTo:
                                                              EstadoPedidos
                                                                      .Recibido
                                                                  .serialize(),
                                                        ),
                                                      ))
                                                      .orderBy('Ped_Fecha_Hora',
                                                          descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitFadingGrid(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PedidoRecord>
                                                  columnPedidoRecordList =
                                                  snapshot.data!;

                                              return SingleChildScrollView(
                                                controller:
                                                    _model.columnController1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          columnPedidoRecordList
                                                              .length,
                                                          (columnIndex) {
                                                    final columnPedidoRecord =
                                                        columnPedidoRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          CarritoRecord>(
                                                        stream: CarritoRecord
                                                            .getDocument(
                                                                columnPedidoRecord
                                                                    .carritoRef!),
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

                                                          final containerCarritoRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      8.0,
                                                                  color: Color(
                                                                      0x1A000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          16.0,
                                                                          12.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  StreamBuilder<
                                                                      ProductoRecord>(
                                                                    stream: ProductoRecord.getDocument(
                                                                        containerCarritoRecord
                                                                            .producto!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                SpinKitFadingGrid(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 40.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final rowProductoRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                90.0,
                                                                            height:
                                                                                90.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).grey3,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.network(
                                                                                rowProductoRecord.proFotoUrl,
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                                errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                  'assets/images/error_image.png',
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'z18vkve1' /* Cevichera Doña Cecilia */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: valueOrDefault<String>(
                                                                                        columnPedidoRecord.pedEstado?.name,
                                                                                        'error ',
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 24.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).coralGreen2,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).coralGreen2,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(6.0),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gxb2x8zt' /* Fecha */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kcalendar,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnPedidoRecord.pedFechaHora?.toString(),
                                                                                            'Error fecha',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'f6jkzdfv' /* Precio */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnPedidoRecord.pedTotal.toString(),
                                                                                            'Error',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: ListadeProductosHistorialWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'dk6eilfe' /* Detalles */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                16.0,
                                                                                24.0,
                                                                                16.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  })
                                                      .divide(SizedBox(
                                                          height: 16.0))
                                                      .addToStart(SizedBox(
                                                          height: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<PedidoRecord>>(
                                            stream: queryPedidoRecord(
                                              queryBuilder: (pedidoRecord) =>
                                                  pedidoRecord
                                                      .where(Filter.or(
                                                        Filter(
                                                          'Cliente_Ref',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                        Filter(
                                                          'Ped_Estado',
                                                          isEqualTo:
                                                              EstadoPedidos
                                                                      .Entregado
                                                                  .serialize(),
                                                        ),
                                                        Filter(
                                                          'Ped_Estado',
                                                          isEqualTo:
                                                              EstadoPedidos
                                                                      .Cancelado
                                                                  .serialize(),
                                                        ),
                                                      ))
                                                      .orderBy('Ped_Fecha_Hora',
                                                          descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitFadingGrid(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PedidoRecord>
                                                  columnPedidoRecordList =
                                                  snapshot.data!;

                                              return SingleChildScrollView(
                                                controller:
                                                    _model.columnController2,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          columnPedidoRecordList
                                                              .length,
                                                          (columnIndex) {
                                                    final columnPedidoRecord =
                                                        columnPedidoRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          CarritoRecord>(
                                                        stream: CarritoRecord
                                                            .getDocument(
                                                                columnPedidoRecord
                                                                    .carritoRef!),
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

                                                          final containerCarritoRecord =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      8.0,
                                                                  color: Color(
                                                                      0x1A000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          16.0,
                                                                          12.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  StreamBuilder<
                                                                      ProductoRecord>(
                                                                    stream: ProductoRecord.getDocument(
                                                                        containerCarritoRecord
                                                                            .producto!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                SpinKitFadingGrid(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 40.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final rowProductoRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                90.0,
                                                                            height:
                                                                                90.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).grey3,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  rowProductoRecord.proFotoUrl,
                                                                                  'https://firebasestorage.googleapis.com/v0/b/proyectoprogramacionmovi-c6375.firebasestorage.app/o/Image-not-found.png?alt=media&token=d7f1ab77-a4b0-4fdb-a373-acbbb22855c2',
                                                                                ),
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ododxty1' /* Cevichera Doña Cecilia */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: valueOrDefault<String>(
                                                                                        (columnPedidoRecord.pedEstado == EstadoPedidos.Entregado) || (columnPedidoRecord.pedEstado == EstadoPedidos.Cancelado) ? '' : '',
                                                                                        'Error ',
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 24.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).green,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).green,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(6.0),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'a7b1rpvd' /* Fecha */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kcalendar,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "d/M h:mm a",
                                                                                              columnPedidoRecord.pedFechaHora,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            'Fecha error',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '9rhw22x8' /* Precio */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnPedidoRecord.pedTotal.toString(),
                                                                                            'error',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'eqnr4msm' /* Detalle */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                16.0,
                                                                                24.0,
                                                                                16.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).white,
                                                                            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'pnjc4uk4' /* Seguimiento */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                16.0,
                                                                                24.0,
                                                                                16.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  })
                                                      .divide(SizedBox(
                                                          height: 16.0))
                                                      .addToStart(SizedBox(
                                                          height: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToStart(SizedBox(height: 30.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
