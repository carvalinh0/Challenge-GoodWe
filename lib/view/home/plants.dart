import 'package:flutter/material.dart';

class PlantsScreen extends StatelessWidget {
  const PlantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('plantas', style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}