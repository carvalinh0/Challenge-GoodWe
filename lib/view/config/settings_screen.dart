import 'package:flutter/material.dart';
import 'system_settings_screen.dart';
import 'message_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações do Sistema'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SystemSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Mensagens'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessageSettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

