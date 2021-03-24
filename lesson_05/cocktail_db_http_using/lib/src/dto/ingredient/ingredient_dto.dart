import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ingredient_dto.g.dart';

abstract class IngredientDto
    implements Built<IngredientDto, IngredientDtoBuilder> {
  static Serializer<IngredientDto> get serializer => _$ingredientDtoSerializer;

  @BuiltValueField(wireName: 'idIngredient')
  String get id;

  @BuiltValueField(wireName: 'strIngredient')
  String get name;

  @BuiltValueField(wireName: 'strDescription')
  String get description;

  @BuiltValueField(wireName: 'strType')
  String get ingredientType;

  @BuiltValueField(wireName: 'strAlcohol')
  bool? get isAlcoholic;

  IngredientDto._();
  factory IngredientDto([void Function(IngredientDtoBuilder) updates]) =
      _$IngredientDto;
}
