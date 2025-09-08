import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Eco_SmartRoom/viewModel/notification_viewmodel.dart';

class WarningsScreen extends StatelessWidget {
  const WarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NotificationViewModel>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: vm.notifications.length,
        itemBuilder: (context, index) {
          final notification = vm.notifications[index];
          return ListTile(
            leading: Icon(
              notification.isRead
                  ? Icons.notifications_none
                  : Icons.notifications_active,
              color: notification.isRead ? Colors.grey : Colors.blue,
            ),
            title: Text(notification.title),
            subtitle: Text(notification.body),
            trailing: Text(
              "${notification.timestamp.day}/${notification.timestamp.month}",
              style: const TextStyle(fontSize: 12),
            ),
            onTap: () {
              vm.markAsRead(notification.id);
            },
          );
        },
      ),
    );
  }
}
