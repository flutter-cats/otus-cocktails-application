// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SimpleAppStateTearOff {
  const _$SimpleAppStateTearOff();

  _SimpleAppState call(
      {required int count, required int remainder, required bool isFetching}) {
    return _SimpleAppState(
      count: count,
      remainder: remainder,
      isFetching: isFetching,
    );
  }
}

/// @nodoc
const $SimpleAppState = _$SimpleAppStateTearOff();

/// @nodoc
mixin _$SimpleAppState {
  int get count => throw _privateConstructorUsedError;
  int get remainder => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimpleAppStateCopyWith<SimpleAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleAppStateCopyWith<$Res> {
  factory $SimpleAppStateCopyWith(
          SimpleAppState value, $Res Function(SimpleAppState) then) =
      _$SimpleAppStateCopyWithImpl<$Res>;
  $Res call({int count, int remainder, bool isFetching});
}

/// @nodoc
class _$SimpleAppStateCopyWithImpl<$Res>
    implements $SimpleAppStateCopyWith<$Res> {
  _$SimpleAppStateCopyWithImpl(this._value, this._then);

  final SimpleAppState _value;
  // ignore: unused_field
  final $Res Function(SimpleAppState) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? remainder = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      remainder: remainder == freezed
          ? _value.remainder
          : remainder // ignore: cast_nullable_to_non_nullable
              as int,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SimpleAppStateCopyWith<$Res>
    implements $SimpleAppStateCopyWith<$Res> {
  factory _$SimpleAppStateCopyWith(
          _SimpleAppState value, $Res Function(_SimpleAppState) then) =
      __$SimpleAppStateCopyWithImpl<$Res>;
  @override
  $Res call({int count, int remainder, bool isFetching});
}

/// @nodoc
class __$SimpleAppStateCopyWithImpl<$Res>
    extends _$SimpleAppStateCopyWithImpl<$Res>
    implements _$SimpleAppStateCopyWith<$Res> {
  __$SimpleAppStateCopyWithImpl(
      _SimpleAppState _value, $Res Function(_SimpleAppState) _then)
      : super(_value, (v) => _then(v as _SimpleAppState));

  @override
  _SimpleAppState get _value => super._value as _SimpleAppState;

  @override
  $Res call({
    Object? count = freezed,
    Object? remainder = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_SimpleAppState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      remainder: remainder == freezed
          ? _value.remainder
          : remainder // ignore: cast_nullable_to_non_nullable
              as int,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SimpleAppState implements _SimpleAppState {
  const _$_SimpleAppState(
      {required this.count, required this.remainder, required this.isFetching});

  @override
  final int count;
  @override
  final int remainder;
  @override
  final bool isFetching;

  @override
  String toString() {
    return 'SimpleAppState(count: $count, remainder: $remainder, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SimpleAppState &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.remainder, remainder) ||
                const DeepCollectionEquality()
                    .equals(other.remainder, remainder)) &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(remainder) ^
      const DeepCollectionEquality().hash(isFetching);

  @JsonKey(ignore: true)
  @override
  _$SimpleAppStateCopyWith<_SimpleAppState> get copyWith =>
      __$SimpleAppStateCopyWithImpl<_SimpleAppState>(this, _$identity);
}

abstract class _SimpleAppState implements SimpleAppState {
  const factory _SimpleAppState(
      {required int count,
      required int remainder,
      required bool isFetching}) = _$_SimpleAppState;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  int get remainder => throw _privateConstructorUsedError;
  @override
  bool get isFetching => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SimpleAppStateCopyWith<_SimpleAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
