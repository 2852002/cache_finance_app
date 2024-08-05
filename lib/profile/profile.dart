import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Color(0xFF171821) : Colors.white;
    // final cardColor = isDarkMode ? Color(0xFF2C2C2E) : Colors.grey[200];
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: iconColor,
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor, // Background color for the entire page
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                child: Icon(
                  Icons.person_3_rounded,
                  color: Color(0xFF6750A4),
                  size: 41,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Aps Technologies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Profile name color
                ),
              ),
              SizedBox(height: 8),
              Text(
                'apstech@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Profile email color
                ),
              ),
              SizedBox(height: 32),
              ListTile(
                leading:
                    Icon(Icons.account_balance, color: iconColor), // Icon color
                title: Text('Account Summary',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your account summary logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: iconColor), // Icon color
                title: Text('History',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your transaction history logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart, color: iconColor), // Icon color
                title: Text('Investment Portfolio',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your investment portfolio logic here
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.notifications, color: iconColor), // Icon color
                title: Text('Notifications',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your notifications logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: iconColor), // Icon color
                title: Text('Help & Support',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your help and support logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: iconColor), // Icon color
                title: Text('Logout',
                    style: TextStyle(color: textColor)), // Text color
                onTap: () {
                  // Add your logout logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
