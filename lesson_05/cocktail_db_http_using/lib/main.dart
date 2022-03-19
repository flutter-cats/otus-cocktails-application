import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final cocktail = await repository.getRandomCocktail();
  print(cocktail);
}