import 'package:json_annotation/json_annotation.dart';

import 'cocktail_dto.dart';

part 'coctail_response_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class  CoctailReponseDto {

  final List<CocktailDto> drinks;

  CoctailReponseDto(this.drinks);

  factory CoctailReponseDto.fromJson(Map<String, dynamic> json) => _$CoctailReponseDtoFromJson(json);
}