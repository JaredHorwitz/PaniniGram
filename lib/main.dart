import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/pangram.dart';

import 'widgets/action_button.dart';
import 'widgets/display_text.dart';
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

  List<dynamic> getLetters(String pangram) {
    return pangram.split('').toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    String answer = ref.watch(answerProvider);
    AsyncValue<List<String>> pangrams = ref.watch(pangramProvider);

    return pangrams.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(stackTrace.toString()),
        data: (data) => MaterialApp(
              title: "PaniniGram",
              color: Colors.white,
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayText(answer: answer),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Hive(
                        letters: getLetters(data[0]),
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
            ));
  }
}
