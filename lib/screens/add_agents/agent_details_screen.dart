import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_button.dart';
import '../user/user_details_screen.dart';
import 'AgentMapScreen.dart';

class AgentDetailsScreen extends StatefulWidget {
  final String agentName;
  final String phoneNumber;
  final String email;

  const AgentDetailsScreen({
    Key? key,
    required this.agentName,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  _AgentDetailsScreenState createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  DateTime? fromDate;
  DateTime? toDate;
  final List<Map<String, String>> assignedUsers = [
    {
      'name': 'User 1',
      'email': 'user1@example.com',
      'address': '123 Maple Street',
      'contact': '555-1234',
      'paidDues': '150',
      'unpaidDues': '50',
      'duesHistory': 'Paid: 150, Unpaid: 50',
      'planDetails': 'Premium Plan'
    },
    {
      'name': 'User 2',
      'email': 'user2@example.com',
      'address': '456 Oak Avenue',
      'contact': '555-5678',
      'paidDues': '200',
      'unpaidDues': '100',
      'duesHistory': 'Paid: 200, Unpaid: 100',
      'planDetails': 'Basic Plan'
    },
    // Add more users as needed
  ];

  void _pickFromDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        fromDate = date;
      });
    }
  }

  void _pickToDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        toDate = date;
      });
    }
  }

  void _makeCall(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $phoneUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Agent Details',
          style: TextStyle(color: theme.textTheme.bodyLarge?.color),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAgentInfoCard(screenWidth, isDarkMode),
              const SizedBox(height: 20),
              _buildDateSelection(isDarkMode),
              const SizedBox(height: 20),
              _buildAssignedUsersList(isDarkMode),
              const SizedBox(height: 20),
              _buildActionButtonsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, bool isDarkMode) {
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$label ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.5,
              color: textColor,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            softWrap: true,
            style: TextStyle(fontSize: 15.5, color: textColor),
          ),
        ),
      ],
    );
  }

  Widget _buildAgentInfoCard(double screenWidth, bool isDarkMode) {
    final Color cardColor =
        isDarkMode ? Color(0xFF21222D) : Color.fromARGB(255, 250, 248, 248);
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color iconColor = isDarkMode ? Colors.white : Colors.black;
    return Container(
      width: screenWidth * 0.95,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.agentName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildRow('Phone Number', widget.phoneNumber, isDarkMode),
          const SizedBox(height: 10),
          _buildRow('Email', widget.email, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildDateSelection(bool isDarkMode) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From Date:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            TextFormField(
              readOnly: true,
              onTap: _pickFromDate,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: fromDate == null
                    ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                    : DateFormat('yyyy-MM-dd').format(fromDate!),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('To Date:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                )),
            TextFormField(
              readOnly: true,
              onTap: _pickToDate,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: toDate == null
                    ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                    : DateFormat('yyyy-MM-dd').format(toDate!),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAssignedUsersList(bool isDarkMode) {
    final Color cardColor =
        isDarkMode ? Color(0xFF21222D) : Color.fromARGB(255, 250, 248, 248);
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assigned Users:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        for (var user in assignedUsers)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: cardColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 5),
                _buildRow('Email:', user['email']!, isDarkMode),
                _buildRow('Address:', user['address']!, isDarkMode),
                _buildRow('Contact:', user['contact']!, isDarkMode),
                _buildRow('Paid Dues:', user['paidDues']!, isDarkMode),
                _buildRow('Unpaid Dues:', user['unpaidDues']!, isDarkMode),
                _buildRow('Dues History:', user['duesHistory']!, isDarkMode),
                _buildRow('Plan Details:', user['planDetails']!, isDarkMode),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildActionButtonsRow() {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Call Agent',
            buttonColor: Color.fromARGB(255, 163, 141, 224),
            onPressed: () => _makeCall(widget.phoneNumber),
          ),
        ),
        SizedBox(width: 10), // Add some space between the buttons
        Expanded(
          child: CustomButton(
            text: 'Track Agent',
            buttonColor: Color.fromARGB(255, 116, 85, 202),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackAgentScreen(
                    agentName: widget.agentName,
                    phoneNumber: widget.phoneNumber,
                    email: widget.email,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
