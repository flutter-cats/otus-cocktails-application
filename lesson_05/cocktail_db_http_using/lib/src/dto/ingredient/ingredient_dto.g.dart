// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IngredientDto> _$ingredientDtoSerializer =
    new _$IngredientDtoSerializer();

class _$IngredientDtoSerializer implements StructuredSerializer<IngredientDto> {
  @override
  final Iterable<Type> types = const [IngredientDto, _$IngredientDto];
  @override
  final String wireName = 'IngredientDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, IngredientDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idIngredient',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'strIngredient',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'strDescription',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'strType',
      serializers.serialize(object.ingredientType,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isAlcoholic;
    if (value != null) {
      result
        ..add('strAlcohol')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  IngredientDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IngredientDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idIngredient':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'strIngredient':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'strDescription':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'strType':
          result.ingredientType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'strAlcohol':
          result.isAlcoholic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$IngredientDto extends IngredientDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String ingredientType;
  @override
  final bool? isAlcoholic;

  factory _$IngredientDto([void Function(IngredientDtoBuilder)? updates]) =>
      (new IngredientDtoBuilder()..update(updates)).build();

  _$IngredientDto._(
      {required this.id,
      required this.name,
      required this.description,
      required this.ingredientType,
      this.isAlcoholic})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'IngredientDto', 'id');
    BuiltValueNullFieldError.checkNotNull(name, 'IngredientDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, 'IngredientDto', 'description');
    BuiltValueNullFieldError.checkNotNull(
        ingredientType, 'IngredientDto', 'ingredientType');
  }

  @override
  IngredientDto rebuild(void Function(IngredientDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngredientDtoBuilder toBuilder() => new IngredientDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IngredientDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        ingredientType == other.ingredientType &&
        isAlcoholic == other.isAlcoholic;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode),
            ingredientType.hashCode),
        isAlcoholic.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IngredientDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('ingredientType', ingredientType)
          ..add('isAlcoholic', isAlcoholic))
        .toString();
  }
}

class IngredientDtoBuilder
    implements Builder<IngredientDto, IngredientDtoBuilder> {
  _$IngredientDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _ingredientType;
  String? get ingredientType => _$this._ingredientType;
  set ingredientType(String? ingredientType) =>
      _$this._ingredientType = ingredientType;

  bool? _isAlcoholic;
  bool? get isAlcoholic => _$this._isAlcoholic;
  set isAlcoholic(bool? isAlcoholic) => _$this._isAlcoholic = isAlcoholic;

  IngredientDtoBuilder();

  IngredientDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _ingredientType = $v.ingredientType;
      _isAlcoholic = $v.isAlcoholic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IngredientDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IngredientDto;
  }

  @override
  void update(void Function(IngredientDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IngredientDto build() {
    final _$result = _$v ??
        new _$IngredientDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'IngredientDto', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'IngredientDto', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'IngredientDto', 'description'),
            ingredientType: BuiltValueNullFieldError.checkNotNull(
                ingredientType, 'IngredientDto', 'ingredientType'),
            isAlcoholic: isAlcoholic);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
