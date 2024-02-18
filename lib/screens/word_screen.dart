import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/words.dart';
import 'package:paninigram/widgets/action_button.dart';

class WordScreen extends ConsumerWidget {
  const WordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> words = ref.watch(wordProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 54, 0, 0),
          child: Center(
            child: Text(
              'My Words',
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
        Flexible(
          flex: 10,
          child: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) => ActionButton(
              text: words[index],
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
