import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/pangram.dart';

import 'widgets/action_button.dart';
import 'widgets/bottom_dialog.dart';
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
  @override
  Widget build(BuildContext context) {
    String answer = ref.watch(answerProvider);

    return MaterialApp(
      title: "PaniniGram",
      color: Colors.white,
      home: Home(
        answer: answer,
        ref: ref,
      ),
    );
  }
}

class Home extends ConsumerStatefulWidget {
  const Home({
    super.key,
    required this.answer,
    required this.ref,
  });

  final String answer;
  final WidgetRef ref;

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  List<int> positions = const [0, 1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<String>> letters = ref.watch(pangramLettersProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayText(answer: widget.answer),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Hive(
              letters: letters,
              positions: positions,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                text: "Delete",
                onPressed: () {
                  debugPrint('Delete');
                  widget.ref.read(answerProvider.notifier).deleteLetter();
                },
              ),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape:
                      CircleBorder(side: BorderSide(color: Color(0xd3d3d3d3))),
                ),
                child: IconButton(
                  icon: const Icon(Icons.loop),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      List<int> newPositions = List.from(positions);
                      newPositions.shuffle();
                      positions = newPositions;
                    });
                  },
                ),
              ),
              ActionButton(
                text: "Enter",
                onPressed: () async {
                  bool success =
                      await widget.ref.watch(solutionProvider.future);
                  debugPrint(success.toString());
                  if (success) {
                    debugPrint('transition now!');
                    if (context.mounted) {
                      showDialog(
                          barrierColor: const Color(0x01000000),
                          context: context,
                          builder: (context) {
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.of(context).pop(true);
                            });
                            return const BottomDialog(
                              success: true,
                            );
                          });
                      var _ = widget.ref.refresh(pangramsProvider);
                      var __ = widget.ref.refresh(answerProvider);
                    }
                  } else {
                    if (context.mounted) {
                      showDialog(
                          barrierColor: const Color(0x01000000),
                          context: context,
                          builder: (context) {
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.of(context).pop(true);
                            });
                            return const BottomDialog(
                              success: false,
                            );
                          });
                    }
                    var _ = widget.ref.refresh(answerProvider);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
