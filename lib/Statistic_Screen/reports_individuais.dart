import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportData {
  final String label;
  final double value;
  ReportData({required this.label, required this.value});
}

class ReportsIndividuais extends StatelessWidget {
  final String plantName;
  final Map<String, List<ReportData>> powerReports;
  final Map<String, List<ReportData>> batteryReports;

  const ReportsIndividuais({
    super.key,
    required this.plantName,
    required this.powerReports,
    required this.batteryReports,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Relatórios - $plantName'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Daily"),
              Tab(text: "Monthly"),
              Tab(text: "Annual"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReportTab(
              reportType: "Daily",
              powerData: powerReports["daily"] ?? [],
              batteryData: batteryReports["daily"] ?? [],
            ),
            ReportTab(
              reportType: "Monthly",
              powerData: powerReports["monthly"] ?? [],
              batteryData: batteryReports["monthly"] ?? [],
            ),
            ReportTab(
              reportType: "Annual",
              powerData: powerReports["annual"] ?? [],
              batteryData: batteryReports["annual"] ?? [],
            ),
          ],
        ),
      ),
    );
  }
}

class ReportTab extends StatelessWidget {
  final String reportType;
  final List<ReportData> powerData;
  final List<ReportData> batteryData;

  const ReportTab({
    super.key,
    required this.reportType,
    required this.powerData,
    required this.batteryData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "$reportType - Potência",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 200, child: DynamicLineChart(data: powerData)),
          const SizedBox(height: 24),
          Text(
            "$reportType - Estado da bateria",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 200, child: DynamicLineChart(data: batteryData)),
        ],
      ),
    );
  }
}

class DynamicLineChart extends StatelessWidget {
  final List<ReportData> data;

  const DynamicLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const Center(child: Text("Sem dados"));

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: <CartesianSeries>[
        LineSeries<ReportData, String>(
          dataSource: data,
          xValueMapper: (d, _) => d.label,
          yValueMapper: (d, _) => d.value,
          color: Colors.blue,
          width: 3,
        ),
      ],
    );
  }
}
