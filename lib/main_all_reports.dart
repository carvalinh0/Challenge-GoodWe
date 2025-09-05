import 'package:flutter/material.dart';
import 'Statistic_Screen/todos_reports.dart';
import 'Statistic_Screen/reports_individuais.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados fake de teste
    final Map<String, Map<String, List<ReportData>>> powerReports = {
      'Planta A': {
        'monthly': List.generate(7, (i) => ReportData(label: 'M$i', value: (i + 1) * 10.0)),
        'annual': List.generate(7, (i) => ReportData(label: 'A$i', value: (i + 1) * 12.0)),
      },
      'Planta B': {
        'monthly': List.generate(7, (i) => ReportData(label: 'M$i', value: (i + 1) * 15.0)),
        'annual': List.generate(7, (i) => ReportData(label: 'A$i', value: (i + 1) * 18.0)),
      },
    };

    final Map<String, Map<String, List<ReportData>>> batteryReports = {
      'Planta A': {
        'monthly': List.generate(7, (i) => ReportData(label: 'M$i', value: 100 - i * 10.0)),
        'annual': List.generate(7, (i) => ReportData(label: 'A$i', value: 100 - i * 12.0)),
      },
      'Planta B': {
        'monthly': List.generate(7, (i) => ReportData(label: 'M$i', value: 90 - i * 8.0)),
        'annual': List.generate(7, (i) => ReportData(label: 'A$i', value: 90 - i * 10.0)),
      },
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodosReports(
        allPlantsPower: powerReports,
        allPlantsBattery: batteryReports,
      ),
    );
  }
}

