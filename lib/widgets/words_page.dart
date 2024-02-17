import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/words.dart';

class WordsPage extends ConsumerWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> words = ref.watch(wordProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Flexible(
          flex: 2,
          child: Center(
            child: Text(
              'My Words',
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
        Flexible(
          flex: 8,
          child: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) => Card(
              child: Text(words[index]),
            ),
          ),
        ),
      ],
    );
  }
}
