import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'plantas_widget.dart' show PlantasWidget;
import 'package:flutter/material.dart';

class PlantasModel extends FlutterFlowModel<PlantasWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaDePlantas = [];
  void addToListaDePlantas(dynamic item) => listaDePlantas.add(item);
  void removeFromListaDePlantas(dynamic item) => listaDePlantas.remove(item);
  void removeAtIndexFromListaDePlantas(int index) =>
      listaDePlantas.removeAt(index);
  void insertAtIndexInListaDePlantas(int index, dynamic item) =>
      listaDePlantas.insert(index, item);
  void updateListaDePlantasAtIndex(int index, Function(dynamic) updateFn) =>
      listaDePlantas[index] = updateFn(listaDePlantas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (plantsList)] action in plantas widget.
  ApiCallResponse? plants;
  // Stores action output result for [Backend Call - API (GetImageAndHomeKitLimit)] action in plantas widget.
  ApiCallResponse? image;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
