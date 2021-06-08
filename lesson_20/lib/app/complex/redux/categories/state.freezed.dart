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
class _$CategoriesStateTearOff {
  const _$CategoriesStateTearOff();

  _CategoriesState call(
      {Iterable<CocktailCategory> categories = const <CocktailCategory>[],
      required CocktailCategory selectedCategory}) {
    return _CategoriesState(
      categories: categories,
      selectedCategory: selectedCategory,
    );
  }
}

/// @nodoc
const $CategoriesState = _$CategoriesStateTearOff();

/// @nodoc
mixin _$CategoriesState {
  Iterable<CocktailCategory> get categories =>
      throw _privateConstructorUsedError;
  CocktailCategory get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res>;
  $Res call(
      {Iterable<CocktailCategory> categories,
      CocktailCategory selectedCategory});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  final CategoriesState _value;
  // ignore: unused_field
  final $Res Function(CategoriesState) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? selectedCategory = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Iterable<CocktailCategory>,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CocktailCategory,
    ));
  }
}

/// @nodoc
abstract class _$CategoriesStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$CategoriesStateCopyWith(
          _CategoriesState value, $Res Function(_CategoriesState) then) =
      __$CategoriesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Iterable<CocktailCategory> categories,
      CocktailCategory selectedCategory});
}

/// @nodoc
class __$CategoriesStateCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesStateCopyWith<$Res> {
  __$CategoriesStateCopyWithImpl(
      _CategoriesState _value, $Res Function(_CategoriesState) _then)
      : super(_value, (v) => _then(v as _CategoriesState));

  @override
  _CategoriesState get _value => super._value as _CategoriesState;

  @override
  $Res call({
    Object? categories = freezed,
    Object? selectedCategory = freezed,
  }) {
    return _then(_CategoriesState(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Iterable<CocktailCategory>,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CocktailCategory,
    ));
  }
}

/// @nodoc

class _$_CategoriesState implements _CategoriesState {
  const _$_CategoriesState(
      {this.categories = const <CocktailCategory>[],
      required this.selectedCategory});

  @JsonKey(defaultValue: const <CocktailCategory>[])
  @override
  final Iterable<CocktailCategory> categories;
  @override
  final CocktailCategory selectedCategory;

  @override
  String toString() {
    return 'CategoriesState(categories: $categories, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoriesState &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(selectedCategory);

  @JsonKey(ignore: true)
  @override
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);
}

abstract class _CategoriesState implements CategoriesState {
  const factory _CategoriesState(
      {Iterable<CocktailCategory> categories,
      required CocktailCategory selectedCategory}) = _$_CategoriesState;

  @override
  Iterable<CocktailCategory> get categories =>
      throw _privateConstructorUsedError;
  @override
  CocktailCategory get selectedCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
