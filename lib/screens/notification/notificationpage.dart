import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Notifications',
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          NotificationItem(
            title: 'New message',
            time: '12:30 PM',
            message: 'You have received a new message from the admin.',
          ),
          NotificationItem(
            title: 'Payment due reminder',
            time: 'Yesterday',
            message: 'Your payment for this month is due.',
          ),
          NotificationItem(
            title: 'New agent registered',
            time: '2 days ago',
            message: 'A new agent has been registered in your network.',
          ),
          NotificationItem(
            title: 'Account verification',
            time: '3 days ago',
            message: 'Your account verification is pending.',
          ),
          NotificationItem(
            title: 'Upcoming meeting',
            time: 'Last week',
            message: 'Reminder: You have a meeting scheduled for next week.',
          ),
          NotificationItem(
            title: 'Document upload complete',
            time: 'Last month',
            message: 'Your document upload is complete and pending review.',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String time;
  final String message;

  const NotificationItem({
    super.key,
    required this.title,
    required this.time,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: isDarkMode ? Color(0xFF21222D) : Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style:
                  TextStyle(color: isDarkMode ? Colors.grey : Colors.grey[600]),
            ),
            const SizedBox(height: 4.0),
            Text(
              message,
              style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black87),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
          // Example: Navigate to a detailed notification screen
        },
      ),
    );
  }
}
