import 'package:flutter/material.dart';

class HintButton extends StatefulWidget {
  const HintButton({
    super.key,
    required this.letter,
  });
  final String letter;

  @override
  State<HintButton> createState() => _HintButtonState();
}

class _HintButtonState extends State<HintButton> {
  bool showLetter = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showLetter = !showLetter;
            });
          },
          child: (showLetter)
              ? Text(widget.letter)
              : const Icon(Icons.question_mark),
        ));
  }
}
