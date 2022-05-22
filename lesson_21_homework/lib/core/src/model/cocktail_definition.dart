import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

///
/// Cocktail Model Definition based on response from
/// curl curl https://the-cocktail-db.p.rapidapi.com/filter.php\?a\=Alcoholic|jora -p
/// Current scheme is:
/// ```
///   {
///   "strDrink": "Zorbatini",
///   "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/wtkqgb1485621155.jpg",
///   "idDrink": "16963"
///   },
///   {
///   "strDrink": "Zorro",
///   "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/kvvd4z1485621283.jpg",
///   "idDrink": "15328"
///   }
///
part 'cocktail_definition.g.dart';

@HiveType(typeId: 0)
class CocktailDefinition extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String drinkThumbUrl;
  @HiveField(3)
  final String? cocktailCategory;

  CocktailDefinition({
    required this.id,
    required this.name,
    required this.drinkThumbUrl,
    this.cocktailCategory,
  });

  CocktailDefinition copyWith(
      {String? id,
      String? name,
      String? drinkThumbUrl,
      String? cocktailCategory,
      bool? isFavourite}) {
    return CocktailDefinition(
      id: id ?? this.id,
      name: name ?? this.name,
      drinkThumbUrl: drinkThumbUrl ?? this.drinkThumbUrl,
      cocktailCategory: cocktailCategory ?? this.cocktailCategory,
    );
  }
}
