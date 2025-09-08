import 'package:Eco_SmartRoom/view/login.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/mainscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Pede permissão no iOS
  await messaging.requestPermission(alert: true, badge: true, sound: true);

  // Pega o token de notificação
  String? token = await messaging.getToken();
  print("Firebase Messaging Token: $token");

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
      home: islogged ? MainScreen() : LoginScreen(),
    );
  }
}
