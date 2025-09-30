// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

String transformer(dynamic input1, dynamic input2) {
  // Garante que cada lista seja de fato List<dynamic>
  List<dynamic> list1Dynamic = (input1 is List) ? input1 : [];
  List<dynamic> list2Dynamic = (input2 is List) ? input2 : [];

  // Converte cada item para Map<String, dynamic>
  List<Map<String, dynamic>> list1 =
      list1Dynamic.map((e) => Map<String, dynamic>.from(e)).toList();
  List<Map<String, dynamic>> list2 =
      list2Dynamic.map((e) => Map<String, dynamic>.from(e)).toList();

  Map<String, Map<String, dynamic>> result = {};

  void processList(List<Map<String, dynamic>> list) {
    for (var item in list) {
      Map<String, dynamic> temp = Map.from(item);
      String? key = temp.remove('key');
      if (key != null) {
        result[key] = {...?result[key], ...temp}; // mescla se já existe
      }
    }
  }

  processList(list1);
  processList(list2);

  return jsonEncode(result);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
