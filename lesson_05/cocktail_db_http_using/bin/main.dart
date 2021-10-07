import 'package:cocktail_db_http_using/src/repository/app_repository.dart';

Future<void> main() async {
  // final repository = AsyncCocktailRepository();
  // final popular = await repository.fetchPopularCocktails();
  // print(popular.length);

  final repository = AppRepository();
  final ingredient = await repository.getIngredientById('552');
  print(ingredient);
}