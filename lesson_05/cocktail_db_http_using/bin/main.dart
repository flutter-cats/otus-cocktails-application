import 'dart:math';

import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();

  final ingredient = await repository.lookupIngredientById(Random().nextInt(615).toString());
  print(ingredient?.id);
  print(ingredient?.name);
  print(ingredient?.description);
  print(ingredient?.ingredientType);
  print(ingredient?.isAlcoholic);

}