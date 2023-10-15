import 'package:flutter/material.dart';

import 'widgets/action_button.dart';
import 'widgets/hive.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<String> inLetters = ['C', 'A', 'M', 'B', 'I', 'N', 'E'];

  @override
  void initState() {
    // TODD: load inLetters from database here - use Firebase?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String answer = 'CINEMA';

    return MaterialApp(
      title: "PaniniGram",
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              answer,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Hive(
                letters: inLetters,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(
                  text: "Delete",
                  onPressed: () => debugPrint('Delete'),
                ),
                ActionButton(
                  text: "Enter",
                  onPressed: () => debugPrint('Enter'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
