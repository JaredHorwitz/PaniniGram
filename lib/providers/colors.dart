import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorNotifier extends StateNotifier<List<int>> {
  ColorNotifier() : super([200, 170, 230, 200]); //argb
  void updateColors() {
    state = [
      150 + Random().nextInt(255 - 150),
      150 + Random().nextInt(255 - 150),
      150 + Random().nextInt(255 - 150),
      150 + Random().nextInt(255 - 150),
    ];
  }
}

final colorProvider =
    StateNotifierProvider<ColorNotifier, List<int>>((ref) => ColorNotifier());
