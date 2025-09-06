import 'package:flutter/material.dart';

class SystemSettingsScreen extends StatelessWidget {
  const SystemSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações do Sistema')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Aqui estão as configurações do sistema.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}


