import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Appointment Reminder',
      'subtitle': 'You have a check-up tomorrow at 10 AM',
      'time': '2h ago',
      'icon': '🩺',
    },
    {
      'title': 'Mood Updated',
      'subtitle': 'Thanks for tracking your mood today!',
      'time': '6h ago',
      'icon': '😊',
    },
    {
      'title': 'New Meditation Added',
      'subtitle': 'Try the new guided breathing session.',
      'time': '1 day ago',
      'icon': '🧘‍♀️',
    },
    {
      'title': 'Daily Tip',
      'subtitle': 'Staying hydrated helps reduce fatigue.',
      'time': '2 days ago',
      'icon': '💧',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gradient Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE14AA7), Color(0xFFAB54EF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Text(
                      notification['icon'] ?? '🔔',
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(notification['title'] ?? ''),
                    subtitle: Text(notification['subtitle'] ?? ''),
                    trailing: Text(
                      notification['time'] ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
