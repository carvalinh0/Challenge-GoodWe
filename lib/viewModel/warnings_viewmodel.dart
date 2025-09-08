import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Eco_SmartRoom/model/app_notification.dart';

class NotificationViewModel extends ChangeNotifier {
  final List<AppNotification> _notifications = [];
  Timer? _timer;

  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  void addNotification(String title, String body) {
    // Evita notificações duplicadas com mesmo título e corpo recentes
    final exists = _notifications.any(
      (n) =>
          n.title == title &&
          n.body == body &&
          DateTime.now().difference(n.timestamp).inMinutes < 10,
    );
    if (exists) return;

    final newNotification = AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      body: body,
      timestamp: DateTime.now(),
    );
    _notifications.insert(0, newNotification); // adiciona no topo
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

  void startChecking() {
    // Verifica imediatamente e depois a cada 1 minuto
    _checkConditions();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _checkConditions();
    });
  }

  void stopChecking() {
    _timer?.cancel();
  }

  void _checkConditions() {
    // Aqui você deve substituir as funções abaixo por suas verificações reais

    // Exemplo: se a bateria estiver baixa
    if (_isBatteryLow()) {
      addNotification("Bateria baixa", "A bateria está com nível crítico.");
    }

    // Exemplo: se a produção de energia for menor que a semana passada
    if (_isPowerGenerationLowerThanLastWeek()) {
      addNotification(
        "Produção reduzida",
        "Esta semana gerou menos energia que a semana anterior.",
      );
    } else if (_isPowerGenerationHigherThanLastWeek()) {
      addNotification(
        "Produção aumentada",
        "Esta semana gerou mais energia que a semana anterior.",
      );
    }

    // Exemplo: problemas técnicos detectados
    if (_hasTechnicalProblems()) {
      addNotification(
        "Problemas técnicos",
        "Foi detectado um problema técnico.",
      );
    }

    // Exemplo: lembrete de manutenção
    if (_isMaintenanceDue()) {
      addNotification(
        "Lembrete de manutenção",
        "Está na hora da manutenção preventiva.",
      );
    }

    // Exemplo: atualização de software disponível
    if (_isSoftwareUpdateAvailable()) {
      addNotification(
        "Atualização disponível",
        "Uma nova versão do software está disponível.",
      );
    }

    // Exemplo: queda de energia detectada
    if (_isPowerOutageDetected()) {
      addNotification(
        "Queda de energia",
        "Foi detectada uma queda de energia.",
      );
    }
  }

  // Simulações de condições - substitua pelas suas regras e dados reais

  bool _isBatteryLow() {
    // Exemplo: retorna true se bateria < 20%
    // Aqui você pode acessar seu modelo de dados real
    return false; // alterar para lógica real
  }

  bool _isPowerGenerationLowerThanLastWeek() {
    // Exemplo: compara produção desta semana com a anterior
    return false; // alterar para lógica real
  }

  bool _isPowerGenerationHigherThanLastWeek() {
    return false; // alterar para lógica real
  }

  bool _hasTechnicalProblems() {
    return false; // alterar para lógica real
  }

  bool _isMaintenanceDue() {
    return false; // alterar para lógica real
  }

  bool _isSoftwareUpdateAvailable() {
    return false; // alterar para lógica real
  }

  bool _isPowerOutageDetected() {
    return false; // alterar para lógica real
  }
}
