import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'alertas_widget.dart' show AlertasWidget;
import 'package:flutter/material.dart';

class AlertasModel extends FlutterFlowModel<AlertasWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaDeAvisos = [];
  void addToListaDeAvisos(dynamic item) => listaDeAvisos.add(item);
  void removeFromListaDeAvisos(dynamic item) => listaDeAvisos.remove(item);
  void removeAtIndexFromListaDeAvisos(int index) =>
      listaDeAvisos.removeAt(index);
  void insertAtIndexInListaDeAvisos(int index, dynamic item) =>
      listaDeAvisos.insert(index, item);
  void updateListaDeAvisosAtIndex(int index, Function(dynamic) updateFn) =>
      listaDeAvisos[index] = updateFn(listaDeAvisos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetPowerStationWariningInfoByMultiCondition)] action in alertas widget.
  ApiCallResponse? warnings;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue3;
  FormFieldController<List<String>>? dropDownValueController3;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue4;
  FormFieldController<List<String>>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
