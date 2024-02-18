import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/pangram.dart';
import 'package:paninigram/widgets/hint_button.dart';

class HintScreen extends ConsumerWidget {
  const HintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<String>> pangrams = ref.watch(pangramsProvider);

    return pangrams.when(data: (data) {
      List<Widget> hintButtons = [];
      for (var letter in data[0].split('')) {
        hintButtons.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: HintButton(letter: letter),
        ));
      }
      return Center(
          child: SizedBox(
        width: 100,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: hintButtons,
        ),
      ));
    }, error: (error, stack) {
      return Center(child: Text('$error: $stack'));
    }, loading: () {
      return const Center(child: Text('Loading'));
    });
  }
}
