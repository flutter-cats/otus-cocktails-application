import 'package:flutter/cupertino.dart';

@immutable
class Ingredient {
  const Ingredient({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredientType,
    required this.isAlcoholic,
  });

  final String id;
  final String name;
  final String description;
  final String ingredientType;
  final bool isAlcoholic;
}
