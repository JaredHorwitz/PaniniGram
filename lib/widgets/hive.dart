import 'package:hexagon/hexagon.dart';
import 'package:flutter/material.dart';

class Hive extends StatelessWidget {
  const Hive({
    super.key,
    required this.letters,
  });
  final List<String> letters;

  String mapCoordinatesToListPosition(int q, int r) {
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
  Widget build(BuildContext context) {
    return InteractiveViewer(
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
                onTap: () => debugPrint(
                    mapCoordinatesToListPosition(coordinates.q, coordinates.r)),
                child: Center(
                  child: Text(
                    mapCoordinatesToListPosition(coordinates.q, coordinates.r),
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
  }
}