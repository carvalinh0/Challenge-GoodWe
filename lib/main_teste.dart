import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'view/mainscreen.dart';
import 'viewModel/notification_viewmodel.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final token = await FirebaseMessaging.instance.getToken();
  print("Firebase Messaging Token: $token");

  final notificationService = NotificationService();
  final notificationViewModel = NotificationViewModel(notificationService);
  await notificationViewModel.init();

  runApp(
    ChangeNotifierProvider<NotificationViewModel>.value(
      value: notificationViewModel,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco SmartRoom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
