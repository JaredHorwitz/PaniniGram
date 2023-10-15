import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provides list of pangrams, e.g addiction,indication
final pangramProvider = FutureProvider<List<String>>((ref) async {
  final content =
      await rootBundle.loadString('packages/paninigram/assets/pangrams.txt');
  final List<String> lines = content.split('\n');
  int lineChoice = Random().nextInt(lines.length);
  String line = lines[lineChoice].toUpperCase();
  List<String> pangrams = line.split(',');

  return pangrams;
});
