// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return _Cocktail.fromJson(json);
}

/// @nodoc
class _$CocktailTearOff {
  const _$CocktailTearOff();

  _Cocktail call(
      {String? id,
      String? drink,
      String? category,
      String? alcoholic,
      @JsonKey(name: 'strGlass') String? glass}) {
    return _Cocktail(
      id: id,
      drink: drink,
      category: category,
      alcoholic: alcoholic,
      glass: glass,
    );
  }

  Cocktail fromJson(Map<String, Object> json) {
    return Cocktail.fromJson(json);
  }
}

/// @nodoc
const $Cocktail = _$CocktailTearOff();

/// @nodoc
mixin _$Cocktail {
  String? get id => throw _privateConstructorUsedError;
  String? get drink => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get alcoholic => throw _privateConstructorUsedError;
  @JsonKey(name: 'strGlass')
  String? get glass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailCopyWith<Cocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailCopyWith<$Res> {
  factory $CocktailCopyWith(Cocktail value, $Res Function(Cocktail) then) =
      _$CocktailCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? drink,
      String? category,
      String? alcoholic,
      @JsonKey(name: 'strGlass') String? glass});
}

/// @nodoc
class _$CocktailCopyWithImpl<$Res> implements $CocktailCopyWith<$Res> {
  _$CocktailCopyWithImpl(this._value, this._then);

  final Cocktail _value;
  // ignore: unused_field
  final $Res Function(Cocktail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? drink = freezed,
    Object? category = freezed,
    Object? alcoholic = freezed,
    Object? glass = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      drink: drink == freezed
          ? _value.drink
          : drink // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      alcoholic: alcoholic == freezed
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as String?,
      glass: glass == freezed
          ? _value.glass
          : glass // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CocktailCopyWith<$Res> implements $CocktailCopyWith<$Res> {
  factory _$CocktailCopyWith(_Cocktail value, $Res Function(_Cocktail) then) =
      __$CocktailCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? drink,
      String? category,
      String? alcoholic,
      @JsonKey(name: 'strGlass') String? glass});
}

/// @nodoc
class __$CocktailCopyWithImpl<$Res> extends _$CocktailCopyWithImpl<$Res>
    implements _$CocktailCopyWith<$Res> {
  __$CocktailCopyWithImpl(_Cocktail _value, $Res Function(_Cocktail) _then)
      : super(_value, (v) => _then(v as _Cocktail));

  @override
  _Cocktail get _value => super._value as _Cocktail;

  @override
  $Res call({
    Object? id = freezed,
    Object? drink = freezed,
    Object? category = freezed,
    Object? alcoholic = freezed,
    Object? glass = freezed,
  }) {
    return _then(_Cocktail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      drink: drink == freezed
          ? _value.drink
          : drink // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      alcoholic: alcoholic == freezed
          ? _value.alcoholic
          : alcoholic // ignore: cast_nullable_to_non_nullable
              as String?,
      glass: glass == freezed
          ? _value.glass
          : glass // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Cocktail implements _Cocktail {
  _$_Cocktail(
      {this.id,
      this.drink,
      this.category,
      this.alcoholic,
      @JsonKey(name: 'strGlass') this.glass});

  factory _$_Cocktail.fromJson(Map<String, dynamic> json) =>
      _$_$_CocktailFromJson(json);

  @override
  final String? id;
  @override
  final String? drink;
  @override
  final String? category;
  @override
  final String? alcoholic;
  @override
  @JsonKey(name: 'strGlass')
  final String? glass;

  @override
  String toString() {
    return 'Cocktail(id: $id, drink: $drink, category: $category, alcoholic: $alcoholic, glass: $glass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cocktail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.drink, drink) ||
                const DeepCollectionEquality().equals(other.drink, drink)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.alcoholic, alcoholic) ||
                const DeepCollectionEquality()
                    .equals(other.alcoholic, alcoholic)) &&
            (identical(other.glass, glass) ||
                const DeepCollectionEquality().equals(other.glass, glass)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(drink) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(alcoholic) ^
      const DeepCollectionEquality().hash(glass);

  @JsonKey(ignore: true)
  @override
  _$CocktailCopyWith<_Cocktail> get copyWith =>
      __$CocktailCopyWithImpl<_Cocktail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CocktailToJson(this);
  }
}

abstract class _Cocktail implements Cocktail {
  factory _Cocktail(
      {String? id,
      String? drink,
      String? category,
      String? alcoholic,
      @JsonKey(name: 'strGlass') String? glass}) = _$_Cocktail;

  factory _Cocktail.fromJson(Map<String, dynamic> json) = _$_Cocktail.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get drink => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get alcoholic => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'strGlass')
  String? get glass => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CocktailCopyWith<_Cocktail> get copyWith =>
      throw _privateConstructorUsedError;
}
