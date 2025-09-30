import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'informacoes_planta_model.dart';
export 'informacoes_planta_model.dart';

/// Crie uma página que contenhano titulo o nome da planta, depois uma caixa
/// com: criado em, classificação, capacidade, endereço.
///
/// uma caixa com: geração fotovoltaice (valor), receita, geração total,
/// receita total. uma caixa com informações do inversor com: estado do
/// inversor, nome do inversor, modelo, ns, checkcode, potencia nominal, data
/// de conexão, potencia, ac voltage, corrente ca, frequencia ca, total de
/// horas produção total, temperatura interna, Tensão/Corrente MPPT 1,
/// Tensão/Corrente MPPT 2 e RSSI.
class InformacoesPlantaWidget extends StatefulWidget {
  const InformacoesPlantaWidget({
    super.key,
    required this.plantid,
  });

  final String? plantid;

  static String routeName = 'informacoesPlanta';
  static String routePath = '/informacoesPlanta';

  @override
  State<InformacoesPlantaWidget> createState() =>
      _InformacoesPlantaWidgetState();
}

class _InformacoesPlantaWidgetState extends State<InformacoesPlantaWidget>
    with TickerProviderStateMixin {
  late InformacoesPlantaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformacoesPlantaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          while ((_model.getPlantDetailById?.succeeded ?? true)) {
            _model.getPlantDetailById = await DetalhesPlantaCall.call(
              region: valueOrDefault(currentUserDocument?.region, ''),
              token: FFAppState().token,
              powerstationId: widget.plantid,
            );

            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 60000,
              ),
            );
          }
        }),
        Future(() async {
          while ((_model.getPlantInversorDetailById?.succeeded ?? true)) {
            _model.inversores = [];
            safeSetState(() {});
            _model.getPlantInversorDetailById =
                await DetalhesInversoresCall.call(
              region: valueOrDefault(currentUserDocument?.region, ''),
              token: FFAppState().token,
              powerstationId: widget.plantid,
            );

            for (int loop1Index = 0;
                loop1Index <
                    DetalhesInversoresCall.nomeInversor(
                      (_model.getPlantInversorDetailById?.jsonBody ?? ''),
                    )!
                        .length;
                loop1Index++) {
              final currentLoop1Item = DetalhesInversoresCall.nomeInversor(
                (_model.getPlantInversorDetailById?.jsonBody ?? ''),
              )![loop1Index];
              _model.addToInversores(currentLoop1Item);
              safeSetState(() {});
            }
            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 60000,
              ),
            );
          }
        }),
        Future(() async {
          while ((_model.getPowerflow?.succeeded ?? true)) {
            _model.getPowerflow = await PowerflowCall.call(
              region: valueOrDefault(currentUserDocument?.region, ''),
              token: FFAppState().token,
              powerstationId: widget.plantid,
            );

            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 60000,
              ),
            );
          }
        }),
        Future(() async {
          while ((_model.getPlantPowerChart?.succeeded ?? true)) {
            _model.getPlantPowerChart = await GraficoPlantaCall.call(
              region: valueOrDefault(currentUserDocument?.region, ''),
              token: FFAppState().token,
              powerstationId: widget.plantid,
              date: dateTimeFormat(
                "yyyy-MM-dd",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              ),
            );

            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 60000,
              ),
            );
          }
        }),
        Future(() async {
          while ((_model.weather?.succeeded ?? true)) {
            _model.weather = await GetWeatherCall.call(
              region: valueOrDefault(currentUserDocument?.region, ''),
              token: FFAppState().token,
              plantId: widget.plantid,
            );

            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 60000,
              ),
            );
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 280.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
                        'Mais informações',
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
                        borderColor: Color(0xFFE5E7EB),
                        borderRadius: 12.0,
                        borderWidth: 2.0,
                        buttonSize: 48.0,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.build_rounded,
                          color: Color(0xFF15161E),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(GerenciarPlantaWidget.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    DetalhesPlantaCall.nomePlanta(
                      (_model.getPlantDetailById?.jsonBody ?? ''),
                    ),
                    'Carregando...',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                        color: Color(0xFF101213),
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 195.57,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3ACAFF), Colors.white],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GradientText(
                                        'Índice UV',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        colors: [
                                          Color(0xFF3A4AFF),
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                      GradientText(
                                        valueOrDefault<String>(
                                          GetWeatherCall.indiceUV(
                                            (_model.weather?.jsonBody ?? ''),
                                          )?.firstOrNull,
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        colors: [
                                          Color(0xFF3A78FF),
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GradientText(
                                        'Temperatura máxima',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        colors: [
                                          FlutterFlowTheme.of(context).primary,
                                          Color(0xFF3E51F4)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                      GradientText(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            GetWeatherCall.temperaturaMax(
                                              (_model.weather?.jsonBody ?? ''),
                                            )?.firstOrNull,
                                            '0',
                                          )}°C',
                                          '0°C',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.openSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFF3A85FF),
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        () {
                                          if (GetWeatherCall.clima(
                                                (_model.weather?.jsonBody ??
                                                    ''),
                                              )?.firstOrNull ==
                                              'Shower Rain') {
                                            return 'https://iili.io/KGCiZHg.png';
                                          } else if (GetWeatherCall.clima(
                                                (_model.weather?.jsonBody ??
                                                    ''),
                                              )?.firstOrNull ==
                                              'Overcast') {
                                            return 'https://iili.io/KGCsCx4.png';
                                          } else if (GetWeatherCall.clima(
                                                (_model.weather?.jsonBody ??
                                                    ''),
                                              )?.firstOrNull ==
                                              'Sunny') {
                                            return 'https://iili.io/KGCsqbf.png';
                                          } else if (GetWeatherCall.clima(
                                                (_model.weather?.jsonBody ??
                                                    ''),
                                              )?.firstOrNull ==
                                              'Light Rain') {
                                            return 'https://iili.io/KGCsJfI.png';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        'https://iili.io/KGCsqbf.png',
                                      ),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 148.0, 12.0, 12.0),
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
                                'Informações Gerais',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Estado da planta:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                          if (DetalhesPlantaCall.statusPlanta(
                                                (_model.getPlantDetailById
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              1) {
                                            return Color(0xFF24A891);
                                          } else if (DetalhesPlantaCall
                                                  .statusPlanta(
                                                (_model.getPlantDetailById
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              -1) {
                                            return Color(0xFFFF0000);
                                          } else if (DetalhesPlantaCall
                                                  .statusPlanta(
                                                (_model.getPlantDetailById
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              1) {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else {
                                            return Color(0xFFFF0000);
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          () {
                                            if (DetalhesPlantaCall.statusPlanta(
                                                  (_model.getPlantDetailById
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                1) {
                                              return 'Online';
                                            } else if (DetalhesPlantaCall
                                                    .statusPlanta(
                                                  (_model.getPlantDetailById
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
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
                                                      FlutterFlowTheme.of(
                                                              context)
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Criado em:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      DetalhesPlantaCall.dataCriacaoPlanta(
                                        (_model.getPlantDetailById?.jsonBody ??
                                            ''),
                                      ),
                                      'Carregando...',
                                    ),
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID da planta:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              DetalhesPlantaCall.powerStationId(
                                        (_model.getPlantDetailById?.jsonBody ??
                                            ''),
                                      )!));
                                    },
                                    child: Text(
                                      valueOrDefault<String>(
                                        DetalhesPlantaCall.powerStationId(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'Carregando...',
                                      ).maybeHandleOverflow(
                                        maxChars: 28,
                                        replacement: '…',
                                      ),
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Classificação:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      DetalhesPlantaCall.tipoPlanta(
                                        (_model.getPlantDetailById?.jsonBody ??
                                            ''),
                                      ),
                                      'Carregando...',
                                    ),
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Capacidade:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    '${DetalhesPlantaCall.capacidadePlanta(
                                      (_model.getPlantDetailById?.jsonBody ??
                                          ''),
                                    )?.toString()}kW',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Endereço:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        DetalhesPlantaCall.enderecoPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'Carregando...',
                                      ).maybeHandleOverflow(
                                        maxChars: 35,
                                        replacement: '…',
                                      ),
                                      textAlign: TextAlign.end,
                                      maxLines: 2,
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Horário da planta:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        DetalhesPlantaCall.horarioPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'Carregando...',
                                      ).maybeHandleOverflow(
                                        maxChars: 35,
                                        replacement: '…',
                                      ),
                                      textAlign: TextAlign.end,
                                      maxLines: 2,
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                                color: Color(0xFFE0E3E7),
                              ),
                              if (DetalhesPlantaCall.capacidadeBateria(
                                    (_model.getPlantDetailById?.jsonBody ?? ''),
                                  )! >
                                  0.0)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Capacidade da bateria:',
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          DetalhesPlantaCall.capacidadeBateria(
                                            (_model.getPlantDetailById
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toString(),
                                          '0',
                                        )}kWh'
                                            .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (DetalhesPlantaCall.capacidadeBateria(
                                    (_model.getPlantDetailById?.jsonBody ?? ''),
                                  )! >
                                  0.0)
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFFE0E3E7),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rendimento total:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    '${DetalhesPlantaCall.moedaPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ) == '-' ? ' ' : DetalhesPlantaCall.moedaPlanta(
                                        (_model.getPlantDetailById?.jsonBody ??
                                            ''),
                                      )}\$ ${valueOrDefault<String>(
                                      formatNumber(
                                        DetalhesPlantaCall.rendaTotalPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        formatType: FormatType.compact,
                                      ),
                                      '0',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF24A891),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rendimento hoje:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    '${DetalhesPlantaCall.moedaPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ) == '-' ? ' ' : DetalhesPlantaCall.moedaPlanta(
                                        (_model.getPlantDetailById?.jsonBody ??
                                            ''),
                                      )}\$ ${DetalhesPlantaCall.rendaPlantaHoje(
                                      (_model.getPlantDetailById?.jsonBody ??
                                          ''),
                                    )?.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF24A891),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Geração atual:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    '${formatNumber(
                                      functions.mega(valueOrDefault<double>(
                                        DetalhesPlantaCall.potenciaPlantaAgora(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        0.0,
                                      )),
                                      formatType: FormatType.compact,
                                    )}Wh',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF24A891),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Geração total:',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    '${formatNumber(
                                      functions.mega(valueOrDefault<double>(
                                        DetalhesPlantaCall.potenciaTotalPlanta(
                                          (_model.getPlantDetailById
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        0.0,
                                      )),
                                      formatType: FormatType.compact,
                                    )}Wh',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF24A891),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                Padding(
                  padding: EdgeInsets.all(12.0),
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
                            'Inversores',
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
                          Builder(
                            builder: (context) {
                              final listaDeInversores =
                                  _model.inversores.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listaDeInversores.length,
                                itemBuilder: (context, listaDeInversoresIndex) {
                                  final listaDeInversoresItem =
                                      listaDeInversores[listaDeInversoresIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            DetalhesInversorWidget.routeName,
                                            queryParameters: {
                                              'chamadaAPI': serializeParam(
                                                DetalhesInversoresCall
                                                    .informacoesInversores(
                                                  (_model.getPlantInversorDetailById
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.elementAtOrNull(
                                                    listaDeInversoresIndex),
                                                ParamType.JSON,
                                              ),
                                              'statusInversor': serializeParam(
                                                DetalhesInversoresCall
                                                    .statusInversor(
                                                  (_model.getPlantInversorDetailById
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.elementAtOrNull(
                                                    listaDeInversoresIndex),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              listaDeInversoresItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.manrope(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF101213),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: Color(0xFFE0E3E7),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 8.0))
                  .addToStart(SizedBox(height: 16.0))
                  .addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
