import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/mainscreen.dart';
import 'viewModel/warnings_viewmodel.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationViewModel = NotificationViewModel();
  notificationViewModel.startChecking();
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
      home: const MainScreen(), // Vai direto para a MainScreen
    );
  }
}
