import 'package:hexagon/hexagon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/models/color.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/colors.dart';

class Hive extends ConsumerWidget {
  const Hive({
    super.key,
    required this.letters,
    required this.positions,
  });
  final List<int> positions;
  final AsyncValue<List<String>> letters;

  String mapCoordinatesToListPosition(
      int q, int r, List<String> letters, List<int> positions) {
    switch ((q, r)) {
      case (0, 0):
        return letters[positions[0]];
      case (0, 1):
        return letters[positions[1]];
      case (0, -1):
        return letters[positions[2]];

      case (1, 0):
        return letters[positions[3]];

      case (1, -1):
        return letters[positions[4]];

      case (-1, 0):
        return letters[positions[5]];

      case (-1, 1):
        return letters[positions[6]];
    }
    return letters[positions[7]];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PColor colors = ref.watch(colorProvider);
    return letters.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(stackTrace.toString()),
        data: (data) {
          return InteractiveViewer(
            minScale: 1.0,
            maxScale: 1.0,
            child: HexagonGrid(
              hexType: HexagonType.FLAT,
              color: Colors.white,
              depth: 1,
              buildTile: (coordinates) => HexagonWidgetBuilder(
                color: (coordinates.q == 0 && coordinates.r == 0)
                    ? colors.centerColor
                    : colors.outerColor,
                padding: 4.0,
                cornerRadius: 8.0,
                child: SizedBox.expand(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => ref.read(answerProvider.notifier).addLetter(
                          mapCoordinatesToListPosition(
                              coordinates.q, coordinates.r, data, positions)),
                      child: Center(
                        child: Text(
                          mapCoordinatesToListPosition(
                              coordinates.q, coordinates.r, data, positions),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
