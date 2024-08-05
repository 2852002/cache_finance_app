import 'package:finance/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run your app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // Set the dark theme
      themeMode: ThemeMode.system, // Use system theme mode
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
