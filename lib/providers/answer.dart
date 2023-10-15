import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnswerNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void addLetter(String letter) {
    if (state.length < 18) {
      state = state + letter;
    }
  }

  void deleteLetter() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }
}

final answerProvider =
    NotifierProvider<AnswerNotifier, String>(() => AnswerNotifier());
