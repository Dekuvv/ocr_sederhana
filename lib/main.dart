import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

/// Entry point of the simple OCR application.
///
/// The [main] function initializes the Flutter app and launches
/// [MyApp], which sets up the theme and the initial route.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCR Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}