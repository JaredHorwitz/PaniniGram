import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/models/color.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/colors.dart';
import 'package:paninigram/providers/pangram.dart';
import 'package:paninigram/providers/words.dart';
import 'package:paninigram/screens/hint_screen.dart';
import 'package:paninigram/screens/profile_screen.dart';
import 'package:paninigram/screens/word_screen.dart';

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
      home: DefaultTabController(
        length: 4,
        child: Home(
          answer: answer,
          ref: ref,
        ),
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
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    PColor colors = ref.watch(colorProvider);
    final AsyncValue<List<String>> letters = ref.watch(pangramLettersProvider);
    List<Widget> widgetOptions = [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
                    ref.read(answerProvider.notifier).deleteLetter();
                  },
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: colors.outerColor,
                    shape: const CircleBorder(
                        side: BorderSide(color: Color(0xd3d3d3d3))),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.loop),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        ref.read(colorProvider.notifier).updateColors();
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
                    bool success = await ref.watch(solutionProvider.future);
                    debugPrint(success.toString());
                    if (success) {
                      debugPrint('transition now!');
                      ref
                          .read(wordProvider.notifier)
                          .addWord(ref.read(answerProvider));
                      if (context.mounted) {
                        showDialog(
                          barrierColor: const Color(0x01000000),
                          context: context,
                          builder: (context) {
                            return FutureBuilder(
                              future: Future.delayed(const Duration(seconds: 1))
                                  .then((value) => true),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Navigator.of(context).pop();
                                }

                                return const TopDialog(
                                  success: true,
                                );
                              },
                            );
                          },
                        );
                        ref.invalidate(pangramsProvider);
                        ref.invalidate(answerProvider);
                      }
                    } else {
                      if (context.mounted) {
                        showDialog(
                          barrierColor: const Color(0x01000000),
                          context: context,
                          builder: (context) {
                            return FutureBuilder(
                              future: Future.delayed(const Duration(seconds: 1))
                                  .then((value) => true),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Navigator.of(context).pop();
                                }

                                return const TopDialog(
                                  success: false,
                                );
                              },
                            );
                          },
                        );
                      }
                      var _ = ref.refresh(answerProvider);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      const WordScreen(),
      const ProfileScreen(),
      const HintScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedItemColor: Colors.amber,
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.hive),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.menu_book),
            label: 'Words',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.lightbulb),
            label: 'Hint',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(child: widgetOptions.elementAt(currentPageIndex)),
    );
  }
}
