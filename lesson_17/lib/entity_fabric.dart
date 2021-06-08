import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/model/cocktail/cocktail_category.dart';
import 'package:lesson_17/model/cocktail/cocktail_type.dart';
import 'package:lesson_17/model/cocktail/glass_type.dart';
import 'package:lesson_17/model/cocktail/ingredient_definition.dart';
import 'package:uuid/uuid.dart';

class EntityFabric {
  factory EntityFabric() {
    return _instance ??= EntityFabric._();
  }

  EntityFabric._();

  static EntityFabric? _instance;

  final int _limit = 10 * 1000;
  final List<Cocktail> _cocktails = [];
  final Uuid _uuid = const Uuid();

  String generateUUID() {
    return _uuid.v4();
  }

  void init() {
    bench.start('Init $_limit Cocktails');
    for (int i = 0; i < _limit; i++) {
      _cocktails.add(
        Cocktail(
          id: generateUUID(),
          name: 'Cocktail - $i',
          instruction: 'Instruction - $i',
          category: CocktailCategory(id: generateUUID(), value: 'Cocktail category value $i', name: 'Cocktail category name $i'),
          glassType: GlassType(id: generateUUID(), value: 'Cocktail glass type value $i', name: 'Cocktail glass type name $i'),
          cocktailType: CocktailType(id: generateUUID(), name: 'Cocktail type name $i', value: 'Cocktail type value $i'),
          ingredients: [
            IngredientDefinition(id: generateUUID(), ingredientName: 'Ingredient name 1 - $i', measure: 'Ingredient measure 1 - $i'),
            IngredientDefinition(id: generateUUID(), ingredientName: 'Ingredient name 2 - $i', measure: 'Ingredient measure 2 - $i'),
            IngredientDefinition(id: generateUUID(), ingredientName: 'Ingredient name 3 - $i', measure: 'Ingredient measure 3 - $i'),
          ],
          drinkThumbUrl: 'Drink thumb url $i',
          isFavourite: i.isEven,
        ),
      );
    }
    bench.end('Init $_limit Cocktails');
  }

  Cocktail get one => _cocktails.first;

  List<Cocktail> get all => _cocktails;
}
