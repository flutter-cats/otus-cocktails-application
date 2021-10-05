import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final ingredient = await repository.lookupIngredientById('552');
  print(ingredient?.description);
}