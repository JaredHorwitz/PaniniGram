import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/models/color.dart';

class ColorNotifier extends StateNotifier<PColor> {
  ColorNotifier()
      : super(const PColor(
            centerColor: Color.fromARGB(200, 200, 230, 170),
            outerColor: Color.fromARGB(200, 170, 230, 200))); //argb
  void updateColors() {
    int a = 150 + Random().nextInt(255 - 150);
    int r = 150 + Random().nextInt(255 - 150);
    int g = 150 + Random().nextInt(255 - 150);
    int b = 150 + Random().nextInt(255 - 150);
    Color newCenterColor = Color.fromARGB(a, b, g, r);
    Color newOuterColor = Color.fromARGB(a, r, g, b);
    state = PColor(centerColor: newCenterColor, outerColor: newOuterColor);
  }
}

final colorProvider =
    StateNotifierProvider<ColorNotifier, PColor>((ref) => ColorNotifier());
