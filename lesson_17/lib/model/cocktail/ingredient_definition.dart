import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lesson_17/model/entity.dart';

part 'ingredient_definition.g.dart';

@immutable
@HiveType(typeId: 5)
class IngredientDefinition implements Entity {
  const IngredientDefinition({
    required this.id,
    required this.ingredientName,
    required this.measure,
  });

  factory IngredientDefinition.fromJson(Map<String, String> json) {
    return IngredientDefinition(
      id: json['id']!,
      ingredientName: json['ingredientName']!,
      measure: json['measure']!,
    );
  }

  @override
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String ingredientName;

  @HiveField(2)
  final String measure;

  @override
  Map<String, String> toJson() {
    return {
      'id': id,
      'ingredientName': ingredientName,
      'measure': measure,
    };
  }
}
