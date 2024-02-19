import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/models/color.dart';
import 'package:paninigram/providers/colors.dart';
import 'package:paninigram/providers/words.dart';

class WordScreen extends ConsumerWidget {
  const WordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> words = ref.watch(wordProvider);
    PColor colors = ref.watch(colorProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 72, 0, 0),
          child: Center(
            child: Text(
              'My Words',
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: (index % 2 == 0)
                        ? MaterialStatePropertyAll(colors.outerColor)
                        : MaterialStatePropertyAll(colors.centerColor),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text(words[index]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
