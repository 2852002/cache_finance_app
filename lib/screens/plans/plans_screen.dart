import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  final List<Map<String, String>> plans = [
    {
      'title': 'Basic Plan',
      'details': '1-year tenure with 5% annual interest.',
    },
    {
      'title': 'Silver Plan',
      'details': '2-year tenure with 6% annual interest.',
    },
    {
      'title': 'Gold Plan',
      'details': '3-year tenure with 7% annual interest.',
    },
    {
      'title': 'Platinum Plan',
      'details': '4-year tenure with 8% annual interest.',
    },
    {
      'title': 'Diamond Plan',
      'details': '5-year tenure with 9% annual interest.',
    },
    {
      'title': 'Elite Plan',
      'details': '6-year tenure with 10% annual interest.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Color(0xFF171821) : Colors.white;
    final cardColor = isDarkMode ? Color(0xFF21222D) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Plans',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: cardColor,
            child: ListTile(
              title: Text(
                plan['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                plan['details']!,
                style: TextStyle(color: textColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
