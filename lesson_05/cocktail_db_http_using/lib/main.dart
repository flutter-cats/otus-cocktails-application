import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final randomCocktail = await repository.getRandomCocktail();
  print('Random cocktail name: ${randomCocktail?.name}');
  final popularCocktails = await repository.fetchPopularCocktails();
  print('Popular cocktail name: ${popularCocktails.first.name}');
  final ingredient = await repository.lookupIngredientById('554');
  print('Ingredient by id name: ${ingredient?.name}');
  print('Ingredient by id name: ${ingredient?.isAlcoholic}');
}
