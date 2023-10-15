import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';

import 'widgets/action_button.dart';
import 'widgets/hive.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  final List<String> inLetters = ['C', 'A', 'M', 'B', 'I', 'N', 'E'];

  @override
  void initState() {
    // TODD: load inLetters from database here - use Firebase?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String answer = ref.watch(answerProvider);

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
                  onPressed: () {
                    debugPrint('Delete');
                    ref.read(answerProvider.notifier).deleteLetter();
                  },
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
