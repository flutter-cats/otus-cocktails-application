import 'package:cocktail_db_http_using/models.dart';
import 'package:cocktail_db_http_using/src/repository/app_repository.dart';

Future<void> main() async {
  // final repository = AsyncCocktailRepository();
  // final ingredient = await repository.lookupIngredientById('552');
  // print(ingredient?.description);

  final repository = AppRepository();
  final coctails = await repository.getCoctails();
  // print(coctails.drinks.map((e) => e.strDrink).toList().toString());
}