import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Displays the OCR result text with newlines intact and provides a Home FAB.
class ResultScreen extends StatelessWidget {
  /// The recognized text from the OCR process.
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil OCR')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            ocrText.isEmpty ? 'Tidak ada teks ditemukan.' : ocrText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate back to HomeScreen and clear all previous routes
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
