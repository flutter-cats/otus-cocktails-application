import 'package:cocktail_db_http_using/models.dart';
import 'dart:developer';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final cocktail = await repository.getRandomCocktail();
  // print(cocktail);

  final ingridient = await repository.lookupIngredientById("552");

  inspect(ingridient);
}
