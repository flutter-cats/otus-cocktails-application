import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final cocktailDetail = await repository.fetchCocktailDetails('11007');
  print(cocktailDetail?.id);
  print(cocktailDetail?.name);
  print(cocktailDetail?.cocktailType);
  print(cocktailDetail?.instruction);
  print('');
  final cocktail = await repository.getRandomCocktail();
  print(cocktail?.id);
  print(cocktail?.name);
  print(cocktail?.cocktailType);
  print(cocktail?.instruction);
  print('');
  final ingredient = await repository.lookupIngredientById('11149');
  print(ingredient?.id);
  print(ingredient?.name);
  print(ingredient?.description);
  print(ingredient?.isAlcoholic);
}