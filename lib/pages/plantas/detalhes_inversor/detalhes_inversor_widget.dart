import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detalhes_inversor_model.dart';
export 'detalhes_inversor_model.dart';

class DetalhesInversorWidget extends StatefulWidget {
  const DetalhesInversorWidget({
    super.key,
    required this.chamadaAPI,
    required this.statusInversor,
  });

  final dynamic chamadaAPI;
  final int? statusInversor;

  static String routeName = 'detalhesInversor';
  static String routePath = '/detalhesInversor';

  @override
  State<DetalhesInversorWidget> createState() => _DetalhesInversorWidgetState();
}

class _DetalhesInversorWidgetState extends State<DetalhesInversorWidget> {
  late DetalhesInversorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesInversorModel());
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Color(0xFFE5E7EB),
                        borderRadius: 12.0,
                        borderWidth: 2.0,
                        buttonSize: 48.0,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFF15161E),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Text(
                        getJsonField(
                          widget.chamadaAPI,
                          r'''$.name''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF15161E),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Color(0x00E5E7EB),
                        borderRadius: 12.0,
                        borderWidth: 2.0,
                        buttonSize: 48.0,
                        fillColor: Color(0x00FFFFFF),
                        icon: Icon(
                          Icons.build_rounded,
                          color: Color(0x0015161E),
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 5.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informações do Inversor',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Estado do Inversor:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (widget.statusInversor == 1) {
                                        return Color(0xFF24A891);
                                      } else if (widget.statusInversor == -1) {
                                        return Color(0xFFFF0000);
                                      } else {
                                        return Color(0xFFFF0000);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      () {
                                        if (widget.statusInversor == 1) {
                                          return 'Ativo';
                                        } else if (widget.statusInversor ==
                                            -1) {
                                          return 'Offline';
                                        } else {
                                          return 'Offline';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'dmDeviceType'),
                                r'''$.value''',
                              ) ==
                              null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Modelo:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF101213),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'dmDeviceType'),
                                    r'''$.value''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'dmDeviceType'),
                                r'''$.value''',
                              ) ==
                              null)
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'NS:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'serialNum'),
                                  r'''$.value''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Checkcode:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'laCheckcode'),
                                  r'''$.value''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'outputV'),
                                r'''$.value''',
                              ) !=
                              null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Voltagem de saída:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF101213),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'outputV'),
                                      r'''$.value''',
                                    )?.toString(),
                                    '0',
                                  )}${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'outputV'),
                                      r'''$.unit''',
                                    )?.toString(),
                                    'V',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'outputV'),
                                r'''$.value''',
                              ) !=
                              null)
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Data de Conexão:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                getJsonField(
                                  widget.chamadaAPI,
                                  r'''$.last_refresh_time''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Potência Nominal:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'DeviceParameter_capacity'),
                                    r'''$.value''',
                                  )?.toString(),
                                  '0',
                                )}${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'DeviceParameter_capacity'),
                                    r'''$.value''',
                                  )?.toString(),
                                  'W',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Voltagem AC:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'acVacVol'),
                                  r'''$.value''',
                                ).toString()}${getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'acVacVol'),
                                  r'''$.unit''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'acCurrent'),
                                r'''$.value''',
                              ) !=
                              null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Corrente AC:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF101213),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'acCurrent'),
                                      r'''$.value''',
                                    )?.toString(),
                                    '0',
                                  )}${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'acCurrent'),
                                      r'''$.unit''',
                                    )?.toString(),
                                    'A',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'acCurrent'),
                                r'''$.value''',
                              ) !=
                              null)
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Frequência AC:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'acFrequency'),
                                    r'''$.value''',
                                  )?.toString(),
                                  '0',
                                )}${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'acFrequency'),
                                    r'''$.unit''',
                                  )?.toString(),
                                  'Hz',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total de Horas:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                getJsonField(
                                  widget.chamadaAPI,
                                  r'''$.hTotal''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Produção Total:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  formatNumber(
                                    functions.mega(getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.etotal''',
                                    )),
                                    formatType: FormatType.compact,
                                  ),
                                  '0',
                                )}Wh',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Temperatura Interna:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'innerTemp'),
                                  r'''$.value''',
                                ).toString()}${getJsonField(
                                  functions.getJSONkey(
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.left''',
                                        true,
                                      )!,
                                      getJsonField(
                                        widget.chamadaAPI,
                                        r'''$.dict.right''',
                                        true,
                                      )!,
                                      'innerTemp'),
                                  r'''$.unit''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFCA6C45),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tensão/Corrente MPPT 1:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF101213),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'dcVandC1'),
                                    r'''$.value''',
                                  )?.toString(),
                                  '-',
                                )}${valueOrDefault<String>(
                                  getJsonField(
                                    functions.getJSONkey(
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.left''',
                                          true,
                                        )!,
                                        getJsonField(
                                          widget.chamadaAPI,
                                          r'''$.dict.right''',
                                          true,
                                        )!,
                                        'dcVandC1'),
                                    r'''$.unit''',
                                  )?.toString(),
                                  '-',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE0E3E7),
                          ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'dcVandC2'),
                                r'''$.value''',
                              ) !=
                              null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tensão/Corrente MPPT 2:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF101213),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'dcVandC2'),
                                      r'''$.value''',
                                    )?.toString(),
                                    '-',
                                  )}${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'dcVandC2'),
                                      r'''$.unit''',
                                    )?.toString(),
                                    '-',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'dcVandC2'),
                                r'''$.value''',
                              ) !=
                              null)
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                          if (getJsonField(
                                functions.getJSONkey(
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.left''',
                                      true,
                                    )!,
                                    getJsonField(
                                      widget.chamadaAPI,
                                      r'''$.dict.right''',
                                      true,
                                    )!,
                                    'RSSI'),
                                r'''$.value''',
                              ) !=
                              null)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'RSSI:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF101213),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'RSSI'),
                                      r'''$.value''',
                                    )?.toString(),
                                    '-',
                                  )}${valueOrDefault<String>(
                                    getJsonField(
                                      functions.getJSONkey(
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.left''',
                                            true,
                                          )!,
                                          getJsonField(
                                            widget.chamadaAPI,
                                            r'''$.dict.right''',
                                            true,
                                          )!,
                                          'RSSI'),
                                      r'''$.unit''',
                                    )?.toString(),
                                    '-',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF24A891),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
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
