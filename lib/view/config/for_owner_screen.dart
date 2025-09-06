import 'package:flutter/material.dart';

class ForOwnerScreen extends StatelessWidget {
  const ForOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Para o Proprietário')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Configurações específicas para o proprietário do sistema.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}




