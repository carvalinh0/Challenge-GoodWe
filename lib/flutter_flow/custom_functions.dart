import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double mega(double num) {
  return (num * 1000);
}

String statusF(int? status) {
  if (status == 1) {
    return "Online";
  } else if (status == -1) {
    return "Offline";
  } else if (status == 0) {
    return "Em espera";
  } else {
    return "$status";
  }
}

Color? statusC(int? status) {
  if (status == 1) {
    return Colors.green;
  } else if (status == -1) {
    return Colors.red;
  } else if (status == 0) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

String? warningStatusText(int? status) {
  if (status == 0) {
    return "Acontecendo";
  } else if (status == 1) {
    return "Recuperado";
  }
}

Color? warningStatusColor(int? status) {
  if (status == 0) {
    return Colors.red;
  } else if (status == 1) {
    return Colors.green;
  }
}

List<int>? to12(List<String> lista) {
  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
}

List<double>? jsonToChart(
  List<dynamic> jsonChart,
  String tipo,
) {
  final resultado = List<double>.filled(12, 0);

  for (var mes in jsonChart) {
    try {
      final date = mes['date'] as String;
      final partes = date.split("-");
      if (partes.length < 2) continue;

      final mesNumero = int.parse(partes[1]); // "07" -> 7
      if (mesNumero < 1 || mesNumero > 12) continue;

      final content = (mes[tipo] as num).toDouble();
      resultado[mesNumero - 1] = content;
    } catch (e) {
      // ignora se algo estiver errado no JSON
      continue;
    }
  }

  return resultado;
}

dynamic getJSONkey(
  List<dynamic> listA,
  List<dynamic> listB,
  String key,
) {
  final result = <Map<String, dynamic>>[];

  for (final item in listA) {
    if (item is Map<String, dynamic>) {
      result.add(item);
    }
  }

  for (final item in listB) {
    if (item is Map<String, dynamic>) {
      result.add(item);
    }
  }

  for (final item in result) {
    if (item['key'] == key) {
      return item;
    }
  }
  return null; // caso não ache
}

DateTime getdate() {
  return DateTime.utc(2000, 1, 1);
}

int? filterStatus(
  List<int> status,
  List<int> quantidade,
  int statusAlvo,
) {
  for (var i = 0; i < status.length; i++) {
    if (status[i] == statusAlvo) {
      return quantidade[i];
    }
  }
}
