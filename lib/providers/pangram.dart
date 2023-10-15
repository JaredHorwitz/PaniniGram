import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paninigram/providers/answer.dart';

//provides list of pangrams, e.g addiction,indication
final pangramsProvider = FutureProvider<List<String>>((ref) async {
  final content =
      await rootBundle.loadString('packages/paninigram/assets/pangrams.txt');
  final List<String> lines = content.split('\n');
  int lineChoice = Random().nextInt(lines.length);
  String line = lines[lineChoice].toUpperCase();
  List<String> pangrams = line.split(',');
  debugPrint('Pangram: ${pangrams[0]}');

  return pangrams;
});

final pangramLettersProvider = FutureProvider<List<String>>((ref) async {
  List<String> pangrams = await ref.watch(pangramsProvider.future);
  return pangrams[0].split('').toSet().toList();
});

final solutionProvider = FutureProvider<bool>((ref) async {
  List<String> pangrams = await ref.watch(pangramsProvider.future);
  String answer = ref.watch(answerProvider);
  return pangrams.contains(answer);
});
