import 'package:finance/reports/reportpage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsScreen extends StatelessWidget {
  final Map<String, String>? user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
        leading: const BackButton(),
        title: Text(
          'User Details',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    user?['name'] ?? 'No Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildRow('Address', user?['address'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow('Contact', user?['contact'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow('Paid Dues', user?['paidDues'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow('Unpaid Dues', user?['unpaidDues'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow(
                'Upcoming Dues', user?['upcomingDues'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow(
                'Dues History', user?['duesHistory'] ?? 'N/A', isDarkMode),
            const SizedBox(height: 15),
            _buildRow(
                'Plan Details', user?['planDetails'] ?? 'N/A', isDarkMode),
            const Spacer(), // Pushes the buttons to the bottom
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _makeCall(user?['contact'] ?? ''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 163, 141, 224),
                    ),
                    child: Text(
                      'Call',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Adds space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 116, 85, 202),
                    ),
                    child: Text(
                      'Report',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            softWrap: true,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void _makeCall(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      // Handle the case where the phone number is empty
      print('Phone number is empty');
      return;
    }

    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error or show a message to the user if the dialer can't be opened
      print('Could not launch $phoneUri');
    }
  }
}
