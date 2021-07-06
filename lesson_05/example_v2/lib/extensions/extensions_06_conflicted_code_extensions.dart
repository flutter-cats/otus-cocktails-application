import 'package:example_v2/model/cocktail.dart';

extension FromJson on Map<String, dynamic> {
  Cocktail toCocktail() => Cocktail(
        id: this['idDrink'] as String,
        name: this['strDrink'] as String,
      );
}
