import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cocktail_definition.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(createFactory: true, createToJson: true)
class CocktailDefinition {
  @HiveField(0)
  final String? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? drinkThumbUrl;
  @HiveField(4)
  final bool? isFavourite;

  CocktailDefinition({
    @required this.id,
    @required this.name,
    @required this.drinkThumbUrl,
    @required this.isFavourite,
  });

  Map<String, dynamic> toJson() => _$CocktailDefinitionToJson(this);

  factory CocktailDefinition.fromJson(Map<String, dynamic> json) => _$CocktailDefinitionFromJson(json);
}
