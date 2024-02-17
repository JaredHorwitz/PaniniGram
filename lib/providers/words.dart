import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordsNotifier extends StateNotifier<List<String>> {
  WordsNotifier() : super([]);
  //TODO load user words from database
  void addWord(String word) {
    state = [...state, word];
  }
}

final wordProvider = StateNotifierProvider<WordsNotifier, List<String>>(
    (ref) => WordsNotifier());
