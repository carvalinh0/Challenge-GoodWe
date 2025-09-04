import 'package:flutter/material.dart';

class WarningsScreen extends StatelessWidget {
  const WarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Alertas', style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}