import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/componentes/barralateral/barralateral_widget.dart';
import '/componentes/calendario/calendario_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alertas_model.dart';
export 'alertas_model.dart';

/// Preciso criar um página que contenha uma coluna de botões e que dentro dos
/// botões tenham as seguintes informações: nome, endereço, potencia,
/// capacidade, rendimento, hoje, mês, total e classificação
///
class AlertasWidget extends StatefulWidget {
  const AlertasWidget({super.key});

  static String routeName = 'alertas';
  static String routePath = '/alertas';

  @override
  State<AlertasWidget> createState() => _AlertasWidgetState();
}

class _AlertasWidgetState extends State<AlertasWidget> {
  late AlertasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.warnings =
          await GetPowerStationWariningInfoByMultiConditionCall.call(
        region: valueOrDefault(currentUserDocument?.region, ''),
        token: FFAppState().token,
        status: '3',
      );

      safeSetState(() {});
      if ((_model.warnings?.succeeded ?? true)) {
        for (int loop1Index = 0;
            loop1Index <=
                GetPowerStationWariningInfoByMultiConditionCall
                    .quantidadeDeAvisos(
                  (_model.warnings?.jsonBody ?? ''),
                )!;
            loop1Index++) {
          final currentLoop1Item =
              GetPowerStationWariningInfoByMultiConditionCall.nomePlanta(
            (_model.warnings?.jsonBody ?? ''),
          )![loop1Index];
          _model.addToListaDeAvisos(<String, dynamic>{
            'nomePlanta':
                GetPowerStationWariningInfoByMultiConditionCall.nomePlanta(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'snDispositivo':
                GetPowerStationWariningInfoByMultiConditionCall.snDispositivo(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'nomeDispositivo':
                GetPowerStationWariningInfoByMultiConditionCall.nomeDispositivo(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDispositivo':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDispositivo(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDeAlarme':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDeAlarme(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDeFalha':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDeFalha(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDeCulpa':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDeCulpa(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDeErro':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDeErro(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'precisaDeAtencao': GetPowerStationWariningInfoByMultiConditionCall
                .precisaDeAtencao(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'horaDeRecuperacao': GetPowerStationWariningInfoByMultiConditionCall
                .horaDeRecuperacao(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'tipoDeEnergia':
                GetPowerStationWariningInfoByMultiConditionCall.tipoDeEnergia(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'codigoDeAviso':
                GetPowerStationWariningInfoByMultiConditionCall.codigoDeAviso(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'nivelDeAviso':
                GetPowerStationWariningInfoByMultiConditionCall.nivelDeAviso(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'nomeDoAviso':
                GetPowerStationWariningInfoByMultiConditionCall.nomeDoAviso(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'idDaPlanta':
                GetPowerStationWariningInfoByMultiConditionCall.idDaPlanta(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'idDoAviso':
                GetPowerStationWariningInfoByMultiConditionCall.idDoAviso(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'quandoAconteceu':
                GetPowerStationWariningInfoByMultiConditionCall.quandoAconteceu(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
            'regiao': GetPowerStationWariningInfoByMultiConditionCall.regiao(
              (_model.warnings?.jsonBody ?? ''),
            )?.elementAtOrNull(loop1Index),
          });
          safeSetState(() {});
        }
      }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: Color(0xFFE5E7EB),
                              borderRadius: 12.0,
                              borderWidth: 2.0,
                              buttonSize: 48.0,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.menu,
                                color: Color(0xFF15161E),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: BarralateralWidget(
                                          iniciocolor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          plantascolor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          alertascolor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Text(
                            'Alertas',
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
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 48.0,
                            fillColor: Color(0x00FFFFFF),
                            icon: Icon(
                              Icons.account_circle,
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
                    if (false)
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue1 ??= '2',
                                          ),
                                          options: List<String>.from(
                                              ['2', '1', '3']),
                                          optionLabels: [
                                            'Acontecendo',
                                            'Recuperado',
                                            'Todos'
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownValue1 = val),
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 5.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: FlutterFlowDropDown<String>(
                                          multiSelectController: _model
                                                  .dropDownValueController2 ??=
                                              FormListFieldController<String>(
                                                  null),
                                          options: List<String>.from([
                                            'Total_FaultType_Protect',
                                            'Total_FaultType_Operation',
                                            'Total_FaultType_Communication',
                                            'Total_FaultType_System'
                                          ]),
                                          optionLabels: [
                                            'Eventos de proteção',
                                            'Informação sobre condição de operação',
                                            'Comunicação de status',
                                            'Informação do sistema'
                                          ],
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          hintText: 'Classificação de falha...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 5.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: true,
                                          onMultiSelectChanged: (val) =>
                                              safeSetState(() =>
                                                  _model.dropDownValue2 = val),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: FlutterFlowDropDown<String>(
                                          multiSelectController: _model
                                                  .dropDownValueController3 ??=
                                              FormListFieldController<String>(
                                                  null),
                                          options: List<String>.from([
                                            'Total_DeviceType_Generator',
                                            'Total_DeviceType_meter',
                                            'Total_DeviceType_BMS',
                                            'Total_DeviceType_Switch',
                                            'Total_DeviceType_Air',
                                            'Total_DeviceType_inverter',
                                            'Total_DeviceType_Fire',
                                            'Total_DeviceType_cabinet',
                                            'Total_DeviceType_cooling',
                                            'Total_DeviceType_UPS',
                                            'Total_DeviceType_DataLogger',
                                            'Total_DeviceType_EMS'
                                          ]),
                                          optionLabels: [
                                            'Geradores a diesel',
                                            'Medidor',
                                            'BMS Bateria',
                                            'Troca de dispositivo',
                                            'Sistema de ar condicionado',
                                            'Inversor',
                                            'Sistema de proteção contra incêndio',
                                            'Gabinete integrado',
                                            'Sistema de refrigeração liquida',
                                            'UPS',
                                            'Registro',
                                            'EMS'
                                          ],
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          hintText: 'Tipo de dispositivo...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 5.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: true,
                                          onMultiSelectChanged: (val) =>
                                              safeSetState(() =>
                                                  _model.dropDownValue3 = val),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: FlutterFlowDropDown<String>(
                                          multiSelectController: _model
                                                  .dropDownValueController4 ??=
                                              FormListFieldController<String>(
                                                  null),
                                          options: List<String>.from([
                                            'Total_FaultLevel_Prompt',
                                            'Total_FaultLevel_alarm',
                                            'Total_FaultLevel_Fault'
                                          ]),
                                          optionLabels: [
                                            'Terminal',
                                            'Alarme',
                                            'Falha'
                                          ],
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          hintText: 'Nível de falha...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 5.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: true,
                                          onMultiSelectChanged: (val) =>
                                              safeSetState(() =>
                                                  _model.dropDownValue4 = val),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 10.0))
                                        .addToStart(SizedBox(width: 16.0))
                                        .addToEnd(SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Builder(
                                        builder: (context) =>
                                            FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController5 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue5 ??= 'a',
                                          ),
                                          options: List<String>.from(['a']),
                                          optionLabels: ['a'],
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.dropDownValue5 = val);
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: CalendarioWidget(
                                                      title: '',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          hintText: 'abc',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 5.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          safeSetState(() {});
                                        },
                                        text: 'Filtrar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .addToStart(SizedBox(width: 16.0))
                                      .addToEnd(SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    final listaDePlantasListView =
                        _model.listaDeAvisos.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaDePlantasListView.length,
                      itemBuilder: (context, listaDePlantasListViewIndex) {
                        final listaDePlantasListViewItem =
                            listaDePlantasListView[listaDePlantasListViewIndex];
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            height: 280.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 8.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: functions.warningStatusColor(
                                                        GetPowerStationWariningInfoByMultiConditionCall
                                                            .tipoDeAlarme(
                                                      (_model.warnings
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.elementAtOrNull(
                                                            listaDePlantasListViewIndex)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions.warningStatusText(
                                                            GetPowerStationWariningInfoByMultiConditionCall
                                                                .tipoDeAlarme(
                                                          (_model.warnings
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.elementAtOrNull(
                                                                listaDePlantasListViewIndex)),
                                                        'Carregando...',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                GetPowerStationWariningInfoByMultiConditionCall
                                                    .quandoAconteceu(
                                                  (_model.warnings?.jsonBody ??
                                                      ''),
                                                )?.elementAtOrNull(
                                                    listaDePlantasListViewIndex),
                                                'Carregando...',
                                              ).maybeHandleOverflow(
                                                maxChars: 33,
                                                replacement: '…',
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF677681),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  GetPowerStationWariningInfoByMultiConditionCall
                                                      .nomePlanta(
                                                    (_model.warnings
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(
                                                      listaDePlantasListViewIndex),
                                                  'Carregando...',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'NS: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetPowerStationWariningInfoByMultiConditionCall
                                                  .snDispositivo(
                                                (_model.warnings?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(
                                                  listaDePlantasListViewIndex),
                                              'Carregando...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Dispositivo: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetPowerStationWariningInfoByMultiConditionCall
                                                  .nomeDispositivo(
                                                (_model.warnings?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(
                                                  listaDePlantasListViewIndex),
                                              'Carregando...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Código de aviso: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetPowerStationWariningInfoByMultiConditionCall
                                                  .codigoDeAviso(
                                                (_model.warnings?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(
                                                  listaDePlantasListViewIndex),
                                              'Carregando...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Falha: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetPowerStationWariningInfoByMultiConditionCall
                                                  .nomeDoAviso(
                                                (_model.warnings?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(
                                                  listaDePlantasListViewIndex),
                                              'Carregando...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            InformacoesPlantaWidget.routeName,
                                            queryParameters: {
                                              'plantid': serializeParam(
                                                getJsonField(
                                                  listaDePlantasListViewItem,
                                                  r'''$.idPlanta''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Mais Informações',
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
