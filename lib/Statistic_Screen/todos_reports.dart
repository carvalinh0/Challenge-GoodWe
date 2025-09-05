import 'package:flutter/material.dart';
import 'reports_individuais.dart'; // Para a classe ReportData
import 'package:syncfusion_flutter_charts/charts.dart';

class TodosReports extends StatelessWidget {
  final Map<String, Map<String, List<ReportData>>> allPlantsPower;
  final Map<String, Map<String, List<ReportData>>> allPlantsBattery;

  const TodosReports({
    super.key,
    required this.allPlantsPower,
    required this.allPlantsBattery,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Mensal e Anual
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todos os Relatórios'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Monthly'),
              Tab(text: 'Annual'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReportAllTab(
              reportType: 'Monthly',
              allPowerData: allPlantsPower,
              allBatteryData: allPlantsBattery,
            ),
            ReportAllTab(
              reportType: 'Annual',
              allPowerData: allPlantsPower,
              allBatteryData: allPlantsBattery,
            ),
          ],
        ),
      ),
    );
  }
}

class ReportAllTab extends StatelessWidget {
  final String reportType;
  final Map<String, Map<String, List<ReportData>>> allPowerData;
  final Map<String, Map<String, List<ReportData>>> allBatteryData;

  const ReportAllTab({
    super.key,
    required this.reportType,
    required this.allPowerData,
    required this.allBatteryData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: allPowerData.keys.map((plant) {
          final powerData = allPowerData[plant]?[reportType.toLowerCase()] ?? [];
          final batteryData = allBatteryData[plant]?[reportType.toLowerCase()] ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('$plant - $reportType - Potência',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    LineSeries<ReportData, String>(
                      dataSource: powerData,
                      xValueMapper: (data, _) => data.label,
                      yValueMapper: (data, _) => data.value,
                      name: 'Potência',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text('$plant - $reportType - Estado da bateria',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    LineSeries<ReportData, String>(
                      dataSource: batteryData,
                      xValueMapper: (data, _) => data.label,
                      yValueMapper: (data, _) => data.value,
                      name: 'Bateria',
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
  }
}
