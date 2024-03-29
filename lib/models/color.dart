// This file is "main.dart"
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'color.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.

@freezed
class PColor with _$PColor {
  const factory PColor({
    required Color centerColor,
    required Color outerColor,
  }) = _PColor;
}
