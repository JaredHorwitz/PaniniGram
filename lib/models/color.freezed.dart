// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PColor {
  Color get centerColor => throw _privateConstructorUsedError;
  Color get outerColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PColorCopyWith<PColor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PColorCopyWith<$Res> {
  factory $PColorCopyWith(PColor value, $Res Function(PColor) then) =
      _$PColorCopyWithImpl<$Res, PColor>;
  @useResult
  $Res call({Color centerColor, Color outerColor});
}

/// @nodoc
class _$PColorCopyWithImpl<$Res, $Val extends PColor>
    implements $PColorCopyWith<$Res> {
  _$PColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centerColor = null,
    Object? outerColor = null,
  }) {
    return _then(_value.copyWith(
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      outerColor: null == outerColor
          ? _value.outerColor
          : outerColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PColorImplCopyWith<$Res> implements $PColorCopyWith<$Res> {
  factory _$$PColorImplCopyWith(
          _$PColorImpl value, $Res Function(_$PColorImpl) then) =
      __$$PColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color centerColor, Color outerColor});
}

/// @nodoc
class __$$PColorImplCopyWithImpl<$Res>
    extends _$PColorCopyWithImpl<$Res, _$PColorImpl>
    implements _$$PColorImplCopyWith<$Res> {
  __$$PColorImplCopyWithImpl(
      _$PColorImpl _value, $Res Function(_$PColorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centerColor = null,
    Object? outerColor = null,
  }) {
    return _then(_$PColorImpl(
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      outerColor: null == outerColor
          ? _value.outerColor
          : outerColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$PColorImpl with DiagnosticableTreeMixin implements _PColor {
  const _$PColorImpl({required this.centerColor, required this.outerColor});

  @override
  final Color centerColor;
  @override
  final Color outerColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PColor(centerColor: $centerColor, outerColor: $outerColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PColor'))
      ..add(DiagnosticsProperty('centerColor', centerColor))
      ..add(DiagnosticsProperty('outerColor', outerColor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PColorImpl &&
            (identical(other.centerColor, centerColor) ||
                other.centerColor == centerColor) &&
            (identical(other.outerColor, outerColor) ||
                other.outerColor == outerColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, centerColor, outerColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PColorImplCopyWith<_$PColorImpl> get copyWith =>
      __$$PColorImplCopyWithImpl<_$PColorImpl>(this, _$identity);
}

abstract class _PColor implements PColor {
  const factory _PColor(
      {required final Color centerColor,
      required final Color outerColor}) = _$PColorImpl;

  @override
  Color get centerColor;
  @override
  Color get outerColor;
  @override
  @JsonKey(ignore: true)
  _$$PColorImplCopyWith<_$PColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
