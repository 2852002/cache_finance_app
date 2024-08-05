import 'package:flutter/material.dart';

class FinanceSummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String count;

  const FinanceSummaryCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Amount: $amount', style: const TextStyle(fontSize: 14)),
            Text('Count: $count', style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
