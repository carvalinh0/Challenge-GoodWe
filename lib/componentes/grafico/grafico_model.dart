import '/flutter_flow/flutter_flow_util.dart';
import 'grafico_widget.dart' show GraficoWidget;
import 'package:flutter/material.dart';

class GraficoModel extends FlutterFlowModel<GraficoWidget> {
  ///  Local state fields for this component.

  List<int> xside = [];
  void addToXside(int item) => xside.add(item);
  void removeFromXside(int item) => xside.remove(item);
  void removeAtIndexFromXside(int index) => xside.removeAt(index);
  void insertAtIndexInXside(int index, int item) => xside.insert(index, item);
  void updateXsideAtIndex(int index, Function(int) updateFn) =>
      xside[index] = updateFn(xside[index]);

  List<int> yside1 = [];
  void addToYside1(int item) => yside1.add(item);
  void removeFromYside1(int item) => yside1.remove(item);
  void removeAtIndexFromYside1(int index) => yside1.removeAt(index);
  void insertAtIndexInYside1(int index, int item) => yside1.insert(index, item);
  void updateYside1AtIndex(int index, Function(int) updateFn) =>
      yside1[index] = updateFn(yside1[index]);

  List<int> yside2 = [];
  void addToYside2(int item) => yside2.add(item);
  void removeFromYside2(int item) => yside2.remove(item);
  void removeAtIndexFromYside2(int index) => yside2.removeAt(index);
  void insertAtIndexInYside2(int index, int item) => yside2.insert(index, item);
  void updateYside2AtIndex(int index, Function(int) updateFn) =>
      yside2[index] = updateFn(yside2[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
