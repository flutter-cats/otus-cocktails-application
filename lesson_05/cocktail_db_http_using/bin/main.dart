import 'package:cocktail_db_http_using/models.dart';
import 'dart:developer';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  // final cocktail = await repository.getRandomCocktail();
  // print(cocktail);

  final ingredient =
      await repository.lookupIngredientById("552").catchError((error) {
    print("Show error $error for client");
  });
  inspect(ingredient);
}
