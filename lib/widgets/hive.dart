import 'package:hexagon/hexagon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';
import 'package:paninigram/providers/pangram.dart';

class Hive extends ConsumerWidget {
  const Hive({
    super.key,
  });

  String mapCoordinatesToListPosition(int q, int r, List<dynamic> letters) {
    switch ((q, r)) {
      case (0, 0):
        return letters[0];
      case (0, 1):
        return letters[1];
      case (0, -1):
        return letters[2];
      case (1, 0):
        return letters[3];
      case (1, -1):
        return letters[4];
      case (-1, 0):
        return letters[5];
      case (-1, 1):
        return letters[6];
    }
    return letters[0];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<dynamic> letters = ref.watch(pangramLettersProvider);
    return letters.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(stackTrace.toString()),
        data: (data) => InteractiveViewer(
              minScale: 1.0,
              maxScale: 1.0,
              child: HexagonGrid(
                hexType: HexagonType.FLAT,
                color: Colors.white,
                depth: 1,
                buildTile: (coordinates) => HexagonWidgetBuilder(
                  color: (coordinates.q == 0 && coordinates.r == 0)
                      ? Colors.yellow
                      : const Color(0xd9d9d9d9),
                  padding: 4.0,
                  cornerRadius: 8.0,
                  child: SizedBox.expand(
                    child: Material(
                      color: (coordinates.q == 0 && coordinates.r == 0)
                          ? Colors.yellow
                          : const Color(0xd9d9d9d9),
                      child: InkWell(
                        onTap: () => ref
                            .read(answerProvider.notifier)
                            .addLetter(mapCoordinatesToListPosition(
                                coordinates.q, coordinates.r, data)),
                        child: Center(
                          child: Text(
                            mapCoordinatesToListPosition(
                                coordinates.q, coordinates.r, data),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
