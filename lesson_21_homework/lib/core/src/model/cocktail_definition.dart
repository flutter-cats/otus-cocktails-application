
import 'package:hive_flutter/hive_flutter.dart';

part 'cocktail_definition.g.dart';
@HiveType(typeId: 1)
class CocktailDefinition {
   @HiveField(10)
  final String id;
   @HiveField(11)
  final String? name;
   @HiveField(12)
  final String? drinkThumbUrl;
   @HiveField(13)
   bool isFavourite;

  CocktailDefinition({
     id ,
     this.name,
     this.drinkThumbUrl,
    required this.isFavourite,
  }): id = id ?? name ?? 'null';
}
