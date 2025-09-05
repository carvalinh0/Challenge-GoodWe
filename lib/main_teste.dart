import 'package:flutter/material.dart';
import 'Statistic_Screen/reports_individuais.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados fake para teste
    final powerData = List.generate(
      10,
      (index) => ReportData(label: 'H$index', value: (index + 1) * 10.0),
    );
    final batteryData = List.generate(
      10,
      (index) => ReportData(label: 'H$index', value: 100 - index * 5.0),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportsIndividuais(
        plantName: 'Planta Teste',
        powerReports: {
          'daily': powerData,
          'monthly': powerData,
          'annual': powerData,
        },
        batteryReports: {
          'daily': batteryData,
          'monthly': batteryData,
          'annual': batteryData,
        },
      ),
    );
  }
}
