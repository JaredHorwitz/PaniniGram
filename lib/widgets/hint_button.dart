import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/models/color.dart';
import 'package:paninigram/providers/colors.dart';

class HintButton extends ConsumerStatefulWidget {
  const HintButton({
    super.key,
    required this.letter,
  });
  final String letter;

  @override
  ConsumerState<HintButton> createState() => _HintButtonState();
}

class _HintButtonState extends ConsumerState<HintButton> {
  bool showLetter = false;

  @override
  Widget build(BuildContext context) {
    PColor colors = ref.watch(colorProvider);
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: (showLetter)
              ? MaterialStatePropertyAll(colors.outerColor)
              : MaterialStatePropertyAll(colors.centerColor)),
      onPressed: () {
        setState(() {
          showLetter = !showLetter;
        });
      },
      child: (showLetter)
          ? Text(
              widget.letter,
              style: const TextStyle(fontSize: 36),
            )
          : const Icon(
              Icons.question_mark,
              size: 50,
            ),
    );
  }
}
