import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  bool _showbar = false;
  bool get showbar => _showbar;
  set showbar(bool value) {
    _showbar = value;
  }

  Color _termos = Color(4288059030);
  Color get termos => _termos;
  set termos(Color value) {
    _termos = value;
  }

  DateTime? _dataSelecionada =
      DateTime.fromMillisecondsSinceEpoch(1758902520000);
  DateTime? get dataSelecionada => _dataSelecionada;
  set dataSelecionada(DateTime? value) {
    _dataSelecionada = value;
  }

  DateTime? _dataSelecionada2 =
      DateTime.fromMillisecondsSinceEpoch(1506441780000);
  DateTime? get dataSelecionada2 => _dataSelecionada2;
  set dataSelecionada2(DateTime? value) {
    _dataSelecionada2 = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
