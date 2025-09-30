import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _goodWeEmail = data['goodWeEmail'];
      _goodWePwd = data['goodWePwd'];
      _goodWeRegion = data['goodWeRegion'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _goodWeEmail = '';
  String get goodWeEmail => _goodWeEmail;

  String _goodWePwd = '';
  String get goodWePwd => _goodWePwd;

  String _goodWeRegion = '';
  String get goodWeRegion => _goodWeRegion;
}
