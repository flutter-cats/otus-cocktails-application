import 'package:hive_flutter/hive_flutter.dart';
import 'package:cocktail_app_tests/core/hive_helper.dart';
import 'package:meta/meta.dart';

part 'cocktail_definition.g.dart';

@HiveType(typeId: HiveHelper.typeId)
class CocktailDefinition extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? drinkThumbUrl;
  @HiveField(3)
  final String? categoryName;
  @HiveField(4)
  final bool? isFavourite;

  CocktailDefinition({
    @required this.id,
    @required this.name,
    @required this.drinkThumbUrl,
    @required this.categoryName,
    @required this.isFavourite,
  });
}
