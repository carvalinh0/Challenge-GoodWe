import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  int? plantasOnline;

  int? plantasOffline;

  int? plantasNovasMes;

  double? geracaoTotal;

  double? geracaoHoje;

  bool hasError = false;

  double? rendaHoje = 0.0;

  double? rendaTotal = 0.0;

  String? moeda;

  List<double> rendaChart = [];
  void addToRendaChart(double item) => rendaChart.add(item);
  void removeFromRendaChart(double item) => rendaChart.remove(item);
  void removeAtIndexFromRendaChart(int index) => rendaChart.removeAt(index);
  void insertAtIndexInRendaChart(int index, double item) =>
      rendaChart.insert(index, item);
  void updateRendaChartAtIndex(int index, Function(double) updateFn) =>
      rendaChart[index] = updateFn(rendaChart[index]);

  double? potenciaChart;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - crosslogin] action in Dashboard widget.
  String? token;
  // Stores action output result for [Backend Call - API (onlinePlants)] action in Dashboard widget.
  ApiCallResponse? onlinePlantsResponse;
  // Stores action output result for [Backend Call - API (getStatMonth)] action in Dashboard widget.
  ApiCallResponse? chartData;
  // Stores action output result for [Backend Call - API (GetPowerStationTotalData)] action in Dashboard widget.
  ApiCallResponse? environmentalCTT;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
