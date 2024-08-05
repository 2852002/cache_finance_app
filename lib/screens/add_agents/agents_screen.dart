import 'package:flutter/material.dart';
import 'add_agent_screen.dart';
import 'agent_details_screen.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  final List<Map<String, String>> agents = [
    {
      'name': 'Emily Johnson',
      'phone': '+1-555-555-5555',
      'email': 'emily.johnson@gmail.com'
    },
    {
      'name': 'Michael Brown',
      'phone': '+1-555-666-7777',
      'email': 'michael.brown@gmail.com'
    },
    {
      'name': 'Olivia Davis',
      'phone': '+1-555-777-8888',
      'email': 'olivia.davis@gmail.com'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDarkMode ? Color(0xFF171821) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Agents',
          style: TextStyle(color: textColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35,
              color: iconColor,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAgentScreen(),
                ),
              );

              if (result != null && result is Map<String, String>) {
                setState(() {
                  agents.insert(0, result);
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: agents.length,
                itemBuilder: (context, index) {
                  final agent = agents[index];
                  return _buildAgentTile(
                    context,
                    agent['name']!,
                    agent['phone']!,
                    agent['email']!,
                    textColor,
                    iconColor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentTile(BuildContext context, String agentName, String phone,
      String email, Color textColor, Color iconColor) {
    return ListTile(
      title: Text(agentName, style: TextStyle(color: textColor)),
      trailing: Icon(
        Icons.arrow_forward,
        color: iconColor,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgentDetailsScreen(
              agentName: agentName,
              phoneNumber: phone,
              email: email,
            ),
          ),
        );
      },
    );
  }
}
