import 'package:homework/models.dart';

dynamic getKeyValue(Map<String, dynamic> json, String key) {
  if (json[key] != null) {
    return json[key];
  }

  return '';
}

Map<String, String> adaptName(Map<String, dynamic> json) => {
      'en': getKeyValue(json, 'strDrink'),
      'de': getKeyValue(json, 'strDrinkDE'),
      'es': getKeyValue(json, 'strDrinkES'),
      'fr': getKeyValue(json, 'strDrinkFR'),
    };

Map<String, String> adaptInstructions(Map<String, dynamic> json) => {
      'en': getKeyValue(json, 'strInstructions'),
      'de': getKeyValue(json, 'strInstructionsDE'),
      'es': getKeyValue(json, 'strInstructionsES'),
      'fr': getKeyValue(json, 'strInstructionsFR'),
    };

List<IngradientCocktail> adaptIngredients(Map<String, dynamic> json) {
  final ingredients = <IngradientCocktail>[];
  for (var key in json.keys) {
    final ingredient = key.split('strIngredient');
    if (ingredient.length == 2) {
      final ingredientKey = 'strIngredient${ingredient[1]}';
      final measureKey = 'strMeasure${ingredient[1]}';
      if (json[ingredientKey] != null) {
        ingredients.add(IngradientCocktail(
          ingredient: getKeyValue(json, ingredientKey),
          measure: getKeyValue(json, measureKey),
        ));
      }
    }
  }

  return ingredients;
}

Cocktail adaptCoctail({Map<String, dynamic> json, String lang = 'en'}) =>
    Cocktail(
      id: getKeyValue(json, 'idDrink'),
      lang: lang,
      name: adaptName(json),
      dateModified: DateTime.parse(json['dateModified']),
      category: getKeyValue(json, 'strCategory'),
      coctailType: getKeyValue(json, 'strAlcoholic'),
      instructions: adaptInstructions(json),
      glass: getKeyValue(json, 'strGlass'),
      ingredients: adaptIngredients(json),
      thumbUrl: getKeyValue(json, 'strTags'),
      videoUrl: getKeyValue(json, 'strVideo'),
    );
