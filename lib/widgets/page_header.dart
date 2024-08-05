import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          // top: 50,
          ),
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.25, // Adjusted height to 25% of screen height
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF6750A4), // Set your desired background color here
            image: DecorationImage(
              image: AssetImage('assets/login.png'),
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
          ),
        ),
      ),
    );
  }
}
