import 'package:cocktail/core/models.dart';

class Globals {
  static String inSearch = '';
  static List<String> chosenCategories = ['Ordinary Drink'];
}

class GetCoctails {
  Iterable<CocktailDefinition> getListOfCoctailFromChoisedCategories(
      List<String> categories) {
    List<CocktailDefinition> listOfCoctails = [];
    var asyncCocktailRepositoryObject = AsyncCocktailRepository();

    categories.forEach((category) async {
      CocktailCategory cat = category as CocktailCategory;
      var coctailsOfCategory =
          asyncCocktailRepositoryObject.fetchCocktailsByCocktailCategory(cat);
      listOfCoctails.addAll(await coctailsOfCategory);
    });
    return listOfCoctails;
  }
}
