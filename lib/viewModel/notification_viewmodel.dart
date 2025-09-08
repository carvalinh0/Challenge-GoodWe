// Usa firebase_messaging. Ignorar

import 'package:flutter/material.dart';
import 'package:Eco_SmartRoom/model/app_notification.dart';
import 'package:Eco_SmartRoom/services/notification_service.dart';
import 'dart:async';

class NotificationViewModel extends ChangeNotifier {
  final NotificationService _service;
  final List<AppNotification> _notifications = [];

  NotificationViewModel(this._service);

  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  Future<void> init() async {
    _service.onNotificationReceived = (title, body) {
      addNotification(title, body);
    };
    await _service.init();
    _startCleanup();
  }

  void addNotification(String title, String body) {
    final newNotification = AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      body: body,
      timestamp: DateTime.now(),
    );
    _notifications.insert(0, newNotification);
    notifyListeners();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] = AppNotification(
        id: _notifications[index].id,
        title: _notifications[index].title,
        body: _notifications[index].body,
        timestamp: _notifications[index].timestamp,
        isRead: true,
      );
      notifyListeners();
    }
  }

  void _startCleanup() {
    Timer.periodic(const Duration(days: 1), (_) {
      _notifications.removeWhere(
        (n) => DateTime.now().difference(n.timestamp).inDays > 14,
      ); // 2 semanas
      notifyListeners();
    });
  }
}
