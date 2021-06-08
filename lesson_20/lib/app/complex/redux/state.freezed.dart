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
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {required CategoriesState categoriesState,
      required FavoritesState favoritesState,
      required CocktailsState cocktailsState}) {
    return _AppState(
      categoriesState: categoriesState,
      favoritesState: favoritesState,
      cocktailsState: cocktailsState,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  CategoriesState get categoriesState => throw _privateConstructorUsedError;
  FavoritesState get favoritesState => throw _privateConstructorUsedError;
  CocktailsState get cocktailsState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {CategoriesState categoriesState,
      FavoritesState favoritesState,
      CocktailsState cocktailsState});

  $CategoriesStateCopyWith<$Res> get categoriesState;
  $FavoritesStateCopyWith<$Res> get favoritesState;
  $CocktailsStateCopyWith<$Res> get cocktailsState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? categoriesState = freezed,
    Object? favoritesState = freezed,
    Object? cocktailsState = freezed,
  }) {
    return _then(_value.copyWith(
      categoriesState: categoriesState == freezed
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as CategoriesState,
      favoritesState: favoritesState == freezed
          ? _value.favoritesState
          : favoritesState // ignore: cast_nullable_to_non_nullable
              as FavoritesState,
      cocktailsState: cocktailsState == freezed
          ? _value.cocktailsState
          : cocktailsState // ignore: cast_nullable_to_non_nullable
              as CocktailsState,
    ));
  }

  @override
  $CategoriesStateCopyWith<$Res> get categoriesState {
    return $CategoriesStateCopyWith<$Res>(_value.categoriesState, (value) {
      return _then(_value.copyWith(categoriesState: value));
    });
  }

  @override
  $FavoritesStateCopyWith<$Res> get favoritesState {
    return $FavoritesStateCopyWith<$Res>(_value.favoritesState, (value) {
      return _then(_value.copyWith(favoritesState: value));
    });
  }

  @override
  $CocktailsStateCopyWith<$Res> get cocktailsState {
    return $CocktailsStateCopyWith<$Res>(_value.cocktailsState, (value) {
      return _then(_value.copyWith(cocktailsState: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CategoriesState categoriesState,
      FavoritesState favoritesState,
      CocktailsState cocktailsState});

  @override
  $CategoriesStateCopyWith<$Res> get categoriesState;
  @override
  $FavoritesStateCopyWith<$Res> get favoritesState;
  @override
  $CocktailsStateCopyWith<$Res> get cocktailsState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? categoriesState = freezed,
    Object? favoritesState = freezed,
    Object? cocktailsState = freezed,
  }) {
    return _then(_AppState(
      categoriesState: categoriesState == freezed
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as CategoriesState,
      favoritesState: favoritesState == freezed
          ? _value.favoritesState
          : favoritesState // ignore: cast_nullable_to_non_nullable
              as FavoritesState,
      cocktailsState: cocktailsState == freezed
          ? _value.cocktailsState
          : cocktailsState // ignore: cast_nullable_to_non_nullable
              as CocktailsState,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {required this.categoriesState,
      required this.favoritesState,
      required this.cocktailsState});

  @override
  final CategoriesState categoriesState;
  @override
  final FavoritesState favoritesState;
  @override
  final CocktailsState cocktailsState;

  @override
  String toString() {
    return 'AppState(categoriesState: $categoriesState, favoritesState: $favoritesState, cocktailsState: $cocktailsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.categoriesState, categoriesState) ||
                const DeepCollectionEquality()
                    .equals(other.categoriesState, categoriesState)) &&
            (identical(other.favoritesState, favoritesState) ||
                const DeepCollectionEquality()
                    .equals(other.favoritesState, favoritesState)) &&
            (identical(other.cocktailsState, cocktailsState) ||
                const DeepCollectionEquality()
                    .equals(other.cocktailsState, cocktailsState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoriesState) ^
      const DeepCollectionEquality().hash(favoritesState) ^
      const DeepCollectionEquality().hash(cocktailsState);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required CategoriesState categoriesState,
      required FavoritesState favoritesState,
      required CocktailsState cocktailsState}) = _$_AppState;

  @override
  CategoriesState get categoriesState => throw _privateConstructorUsedError;
  @override
  FavoritesState get favoritesState => throw _privateConstructorUsedError;
  @override
  CocktailsState get cocktailsState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
