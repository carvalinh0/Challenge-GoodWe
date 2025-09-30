import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'informacoes_planta_widget.dart' show InformacoesPlantaWidget;
import 'package:flutter/material.dart';

class InformacoesPlantaModel extends FlutterFlowModel<InformacoesPlantaWidget> {
  ///  Local state fields for this page.

  List<String> inversores = [];
  void addToInversores(String item) => inversores.add(item);
  void removeFromInversores(String item) => inversores.remove(item);
  void removeAtIndexFromInversores(int index) => inversores.removeAt(index);
  void insertAtIndexInInversores(int index, String item) =>
      inversores.insert(index, item);
  void updateInversoresAtIndex(int index, Function(String) updateFn) =>
      inversores[index] = updateFn(inversores[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (detalhesPlanta)] action in informacoesPlanta widget.
  ApiCallResponse? getPlantDetailById;
  // Stores action output result for [Backend Call - API (detalhesInversores)] action in informacoesPlanta widget.
  ApiCallResponse? getPlantInversorDetailById;
  // Stores action output result for [Backend Call - API (powerflow)] action in informacoesPlanta widget.
  ApiCallResponse? getPowerflow;
  // Stores action output result for [Backend Call - API (graficoPlanta)] action in informacoesPlanta widget.
  ApiCallResponse? getPlantPowerChart;
  // Stores action output result for [Backend Call - API (GetWeather)] action in informacoesPlanta widget.
  ApiCallResponse? weather;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
