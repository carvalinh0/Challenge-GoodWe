import 'package:flutter/material.dart';

class MyMessageScreen extends StatelessWidget {
  const MyMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Mensagens')),
      body: const Center(
        child: Text(
          'Aqui você pode ver ou configurar suas mensagens.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}



