
import 'package:json_annotation/json_annotation.dart';
import 'ingridient_dto.dart';

part 'ingredient_reponse_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class IngredientResponseDto {

  final List<IngridientDto> ingredients;

  IngredientResponseDto(this.ingredients);

  factory IngredientResponseDto.fromJson(Map<String, dynamic> json) => _$IngredientResponseDtoFromJson(json);
}