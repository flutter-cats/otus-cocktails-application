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
class _$FavoritesStateTearOff {
  const _$FavoritesStateTearOff();

  _FavoritesState call(
      {Map<String, CocktailDefinition> favoritesMap =
          const <String, CocktailDefinition>{}}) {
    return _FavoritesState(
      favoritesMap: favoritesMap,
    );
  }
}

/// @nodoc
const $FavoritesState = _$FavoritesStateTearOff();

/// @nodoc
mixin _$FavoritesState {
  Map<String, CocktailDefinition> get favoritesMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesStateCopyWith<FavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res>;
  $Res call({Map<String, CocktailDefinition> favoritesMap});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  final FavoritesState _value;
  // ignore: unused_field
  final $Res Function(FavoritesState) _then;

  @override
  $Res call({
    Object? favoritesMap = freezed,
  }) {
    return _then(_value.copyWith(
      favoritesMap: favoritesMap == freezed
          ? _value.favoritesMap
          : favoritesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, CocktailDefinition>,
    ));
  }
}

/// @nodoc
abstract class _$FavoritesStateCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(
          _FavoritesState value, $Res Function(_FavoritesState) then) =
      __$FavoritesStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, CocktailDefinition> favoritesMap});
}

/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(
      _FavoritesState _value, $Res Function(_FavoritesState) _then)
      : super(_value, (v) => _then(v as _FavoritesState));

  @override
  _FavoritesState get _value => super._value as _FavoritesState;

  @override
  $Res call({
    Object? favoritesMap = freezed,
  }) {
    return _then(_FavoritesState(
      favoritesMap: favoritesMap == freezed
          ? _value.favoritesMap
          : favoritesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, CocktailDefinition>,
    ));
  }
}

/// @nodoc

class _$_FavoritesState extends _FavoritesState {
  const _$_FavoritesState(
      {this.favoritesMap = const <String, CocktailDefinition>{}})
      : super._();

  @JsonKey(defaultValue: const <String, CocktailDefinition>{})
  @override
  final Map<String, CocktailDefinition> favoritesMap;

  @override
  String toString() {
    return 'FavoritesState(favoritesMap: $favoritesMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoritesState &&
            (identical(other.favoritesMap, favoritesMap) ||
                const DeepCollectionEquality()
                    .equals(other.favoritesMap, favoritesMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(favoritesMap);

  @JsonKey(ignore: true)
  @override
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith =>
      __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);
}

abstract class _FavoritesState extends FavoritesState {
  const factory _FavoritesState(
      {Map<String, CocktailDefinition> favoritesMap}) = _$_FavoritesState;
  const _FavoritesState._() : super._();

  @override
  Map<String, CocktailDefinition> get favoritesMap =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
