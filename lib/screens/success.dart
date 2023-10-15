import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/pangram.dart';

class SuccessScreen extends ConsumerWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String answer = ref.watch(answerProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
              child: Text(
            'Success! $answer was the pangram!',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
          ElevatedButton(
              onPressed: () {
                var _ = ref.refresh(pangramsProvider);
                var __ = ref.refresh(answerProvider);

                Navigator.of(context).pop();
              },
              child: const Text('New Puzzle')),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
