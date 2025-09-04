import 'package:Eco_SmartRoom/view/login.dart';
import 'package:flutter/material.dart';

import 'view/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final islogged = false;
  final forgottenPassword = false;

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco SmartRoom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: islogged ? MainScreen() : LoginScreen()
    );
  }
}
