import 'package:flutter/cupertino.dart';
import 'package:lesson_17/model/cocktail/cocktail_category.dart';
import 'package:lesson_17/model/cocktail/cocktail_type.dart';
import 'package:lesson_17/model/cocktail/glass_type.dart';
import 'package:lesson_17/model/cocktail/ingredient_definition.dart';
import 'package:lesson_17/model/entity.dart';

@immutable
class Cocktail implements Entity {
  const Cocktail({
    required this.id,
    required this.name,
    required this.instruction,
    required this.category,
    required this.glassType,
    required this.cocktailType,
    required this.ingredients,
    required this.drinkThumbUrl,
    required this.isFavourite,
  });

  factory Cocktail.fromJson(Map<dynamic, dynamic> map) {
    return Cocktail(
      id: map['id'] as String,
      name: map['name'] as String,
      instruction: map['instruction'] as String,
      category: CocktailCategory.fromJson(map['category'] as Map<String, String>),
      glassType: GlassType.fromJson(map['glassType'] as Map<String, String>),
      cocktailType: CocktailType.fromJson(map['cocktailType'] as Map<String, String>),
      ingredients: (map['ingredients'] as Iterable<Map<dynamic, dynamic>>).map((Map<dynamic, dynamic> json) => IngredientDefinition.fromJson(json as Map<String, String>)).toList(),
      drinkThumbUrl: map['drinkThumbUrl'] as String,
      isFavourite: map['isFavourite'] as bool,
    );
  }

  @override
  final String id;
  final String name;
  final String instruction;
  final CocktailCategory category;
  final GlassType glassType;
  final CocktailType cocktailType;
  final Iterable<IngredientDefinition> ingredients;
  final String drinkThumbUrl;
  final bool isFavourite;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'instruction': instruction,
      'category': category,
      'glassType': glassType,
      'cocktailType': cocktailType,
      'ingredients': ingredients,
      'drinkThumbUrl': drinkThumbUrl,
      'isFavourite': isFavourite,
    };
  }
}
