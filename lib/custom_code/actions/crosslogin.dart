// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Importações necessárias
import 'dart:convert';
import 'package:http/http.dart' as http;

// Essa função é aceita como Custom Action no FlutterFlow
Future<String> crosslogin(String account, String pwd, String region) async {
  final Map<String, String> BASE = {
    "us": "https://us.semsportal.com",
    "eu": "https://eu.semsportal.com",
  };

  String _initialToken() {
    final original = {
      "uid": "",
      "timestamp": 0,
      "token": "",
      "client": "web",
      "version": "",
      "language": "en"
    };
    final b = utf8.encode(jsonEncode(original));
    return base64.encode(b);
  }

  final url = Uri.parse("${BASE[region]}/api/v2/common/crosslogin");
  final headers = {
    "Token": _initialToken(),
    "Content-Type": "application/json",
    "Accept": "*/*",
  };
  final payload = {
    "account": account,
    "pwd": pwd,
    "agreement_agreement": 0,
    "is_local": false,
  };

  final response =
      await http.post(url, headers: headers, body: jsonEncode(payload));

  if (response.statusCode != 200) {
    throw Exception("Erro HTTP: ${response.statusCode} ${response.body}");
  }

  final js = jsonDecode(response.body);
  if (!js.containsKey("data") || ![0, 1, 200].contains(js["code"])) {
    throw Exception("Login falhou: $js");
  }

  final dataToString = jsonEncode(js["data"]);

  return base64.encode(utf8.encode(dataToString));
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
