import 'package:flutter/material.dart';
import 'add_user_screen.dart';
import 'user_details_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Map<String, String>> users = [
    {
      'name': 'Alice Johnson',
      'address': '123 Maple Street',
      'contact': '555-1234',
      'paidDues': '150',
      'unpaidDues': '50',
      'duesHistory': 'Paid: 150, Unpaid: 50',
      'planDetails': 'Premium Plan'
    },
    {
      'name': 'Bob Smith',
      'address': '456 Oak Avenue',
      'contact': '555-5678',
      'paidDues': '200',
      'unpaidDues': '100',
      'duesHistory': 'Paid: 200, Unpaid: 100',
      'planDetails': 'Basic Plan'
    },
    {
      'name': 'Carol Williams',
      'address': '789 Pine Lane',
      'contact': '555-9012',
      'paidDues': '300',
      'unpaidDues': '150',
      'duesHistory': 'Paid: 300, Unpaid: 150',
      'planDetails': 'Standard Plan'
    },
    {
      'name': 'David Brown',
      'address': '321 Elm Street',
      'contact': '555-3456',
      'paidDues': '400',
      'unpaidDues': '200',
      'duesHistory': 'Paid: 400, Unpaid: 200',
      'planDetails': 'Premium Plan'
    },
    {
      'name': 'Eve Davis',
      'address': '654 Cedar Avenue',
      'contact': '555-7890',
      'paidDues': '250',
      'unpaidDues': '50',
      'duesHistory': 'Paid: 250, Unpaid: 50',
      'planDetails': 'Standard Plan'
    },
    {
      'name': 'Frank Miller',
      'address': '987 Birch Lane',
      'contact': '555-2345',
      'paidDues': '100',
      'unpaidDues': '300',
      'duesHistory': 'Paid: 100, Unpaid: 300',
      'planDetails': 'Basic Plan'
    },
    {
      'name': 'Grace Wilson',
      'address': '159 Spruce Street',
      'contact': '555-6789',
      'paidDues': '350',
      'unpaidDues': '150',
      'duesHistory': 'Paid: 350, Unpaid: 150',
      'planDetails': 'Premium Plan'
    },
    {
      'name': 'Henry Moore',
      'address': '753 Fir Avenue',
      'contact': '555-0123',
      'paidDues': '500',
      'unpaidDues': '100',
      'duesHistory': 'Paid: 500, Unpaid: 100',
      'planDetails': 'Standard Plan'
    },
    {
      'name': 'Ivy Taylor',
      'address': '258 Willow Lane',
      'contact': '555-4567',
      'paidDues': '600',
      'unpaidDues': '50',
      'duesHistory': 'Paid: 600, Unpaid: 50',
      'planDetails': 'Premium Plan'
    },
    {
      'name': 'Jack Anderson',
      'address': '951 Poplar Street',
      'contact': '555-8901',
      'paidDues': '450',
      'unpaidDues': '200',
      'duesHistory': 'Paid: 450, Unpaid: 200',
      'planDetails': 'Basic Plan'
    },
  ];

  void _addUser(Map<String, String> newUser) {
    setState(() {
      users.insert(0, newUser); // Insert new user at the beginning of the list
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF171821) : Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Users',
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddUserScreen(
                          addUserCallback: _addUser,
                        )),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: isDarkMode
                        ? Colors.grey.shade600
                        : Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10.0),
                color: isDarkMode ? Color(0xFF21222D) : Colors.white,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person, // Profile icon
                  color:
                      isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                ),
                title: Text(
                  user['name']!,
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios, // Right arrow icon
                  size: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          UserDetailsScreen(user: user),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
