import 'package:cocktail_db_http_using/models.dart';

Future<void> main() async {
  final repository = AsyncCocktailRepository();
  final cocktail = await repository.getRandomCocktail();
  print(cocktail);
  // Мы получили объект Coctail с данными.
  // Далее вызываю метод, который выведет в консоль описание каждого из составных ингридиентов.
  if (cocktail != null) repository.showDiscriptionOfIngredients(cocktail);
}
