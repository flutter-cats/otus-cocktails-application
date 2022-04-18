class AppStrings {
  static const ingredients = 'Ингредиенты';
  static const instructions = 'Инструкции для приготовления';
  static const cocktailCategory = 'Категория';
  static const cocktailType = 'Тип коктейля';
  static const glassType = 'Тип стекла';

  static const String apiKey =
      'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b';
  static const String baseUrl = 'https://the-cocktail-db.p.rapidapi.com/';
  static const String fetchCocktailDetailsUrl = 'lookup.php';
  static const String cocktailIdParameter = 'i';
  static const String lookupIngredientByIdUrl = 'lookup.php';
  static const String ingredientIdParameter = 'iid';
  static const String fetchCocktailsByCocktailTypeUrl = 'filter.php';
  static const String fetchCocktailsByCocktailCategoryUrl = 'filter.php';
  static const String cocktailTypeParameter = 'a';
  static const String cocktailCategoryParameter = 'c';
  static const String fetchPopularCocktailsUrl = 'popular.php';
  static const String getRandomCocktailUrl = 'random.php';

  static const String loadingProgressText = 'Поиск...';
  static const String searchFieldHint = 'Название коктейля';

  static const String errorButtonText = 'OK';
  static const String fetchErrorTitle = 'Ошибка';
  static const String fetchErrorContent =
      'Ошибка в получении описания коктейля';
}
