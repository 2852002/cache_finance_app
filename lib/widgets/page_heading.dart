import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;
  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSerif',
            ),
      ),
    );
  }
}
