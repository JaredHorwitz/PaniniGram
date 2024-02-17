import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';

class DisplayText extends ConsumerStatefulWidget {
  const DisplayText({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  ConsumerState<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends ConsumerState<DisplayText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String answer = ref.watch(answerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            widget.answer,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (answer.length) < 12
                    ? 32
                    : ((answer.length < 15) ? 25 : 20)),
          ),
        ),
        FadeTransition(
          opacity: _animationController,
          child: Transform.rotate(
            angle: 90 * math.pi / 180,
            child: const SizedBox(
              height: 10,
              child: Icon(
                Icons.horizontal_rule,
                size: 45,
              ),
            ),
          ),
        )
      ],
    );
  }
}
