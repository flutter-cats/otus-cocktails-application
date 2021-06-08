import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lesson_17/model/cocktail/cocktail_category.dart';
import 'package:lesson_17/model/cocktail/cocktail_type.dart';
import 'package:lesson_17/model/cocktail/glass_type.dart';
import 'package:lesson_17/model/cocktail/ingredient_definition.dart';
import 'package:lesson_17/model/entity.dart';

part 'cocktail.g.dart';

@HiveType(typeId: 1)
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
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String instruction;

  @HiveField(3)
  final CocktailCategory category;

  @HiveField(4)
  final GlassType glassType;

  @HiveField(5)
  final CocktailType cocktailType;

  @HiveField(6)
  final Iterable<IngredientDefinition> ingredients;

  @HiveField(7)
  final String drinkThumbUrl;

  @HiveField(8)
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
