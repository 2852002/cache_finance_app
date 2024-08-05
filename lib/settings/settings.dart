import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String name = "John Doe";
  String email = "john.doe@example.com";

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Color(0xFF171821) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: iconColor),
        title: Text(
          'Settings',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildProfileField(name, Icons.person, iconColor, textColor),
              const SizedBox(height: 23),
              _buildProfileField(email, Icons.email, iconColor, textColor),
              const SizedBox(height: 10),
              _buildSettingsTile(
                  'Account', Icons.account_circle, iconColor, textColor),
              _buildSettingsTile('Privacy', Icons.lock, iconColor, textColor),
              _buildSettingsTile(
                  'App Language', Icons.language, iconColor, textColor),
              _buildSettingsTile('Help', Icons.help, iconColor, textColor),
              _buildSettingsTile(
                  'App Updates', Icons.system_update, iconColor, textColor),
              _buildSettingsTile(
                  'Notifications', Icons.notifications, iconColor, textColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(
      String value, IconData icon, Color iconColor, Color textColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 16),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
      String title, IconData icon, Color iconColor, Color textColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      onTap: () {
        // Implement navigation or functionality here
      },
    );
  }
}
