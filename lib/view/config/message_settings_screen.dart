import 'package:flutter/material.dart';
import 'my_message_screen.dart';
import 'for_owner_screen.dart';

class MessageSettingsScreen extends StatelessWidget {
  const MessageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mensagens')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.mail_outline),
            title: const Text('Minhas Mensagens'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyMessageScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Para o Proprietário'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForOwnerScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

