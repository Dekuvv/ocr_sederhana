import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'home_screen.dart';

/// Displays the OCR result text to the user and allows reading it aloud.
class ResultScreen extends StatefulWidget {
  /// The recognized text from the OCR process.
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    // Initialize the text-to-speech engine and set the language to Indonesian
    _flutterTts = FlutterTts();
    _flutterTts.setLanguage('id-ID');
  }

  /// Reads the OCR text aloud using FlutterTts.
  Future<void> _speak() async {
    await _flutterTts.speak(widget.ocrText);
  }

  @override
  void dispose() {
    // Stop the speech engine when leaving the screen
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil OCR')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                // Show the text with newline characters intact
                : widget.ocrText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'home',
            onPressed: () {
              // Navigate back to the HomeScreen and clear any intermediate pages
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                (route) => false,
              );
            },
            child: const Icon(Icons.home),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'tts',
            onPressed: _speak,
            child: const Icon(Icons.volume_up),
          ),
        ],
      ),
    );
  }
}