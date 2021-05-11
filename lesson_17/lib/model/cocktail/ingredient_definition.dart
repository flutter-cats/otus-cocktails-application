import 'package:flutter/cupertino.dart';
import 'package:lesson_17/model/entity.dart';

@immutable
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
  final String id;
  final String ingredientName;
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
