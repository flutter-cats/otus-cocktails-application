import 'dart:convert';

import 'package:cocktail_app_models/models.dart';

///
/// Нет необходимости указывать this
///
///
extension FromJson on String {
  Map<String, dynamic> toJson() => jsonDecode(this);
}

final map = {'first': 1, 'second': 'asdasd'};

final b = map.toCocktail();

extension fromJsonExtension on Map<String, dynamic> {
  Cocktail toCocktail() => Cocktail(
        id: this['idDrink'] as String,
        name: this['strDrink'] as String,
        instruction: this['strInstructions'] as String,
      );

  Cocktail toCocktailExtended() => Cocktail(
        id: this['idDrink'] as String,
        name: this['strDrink'] as String,
        instruction: this['strInstructions'] as String,
      );
}

///
/// Нет необходимости указывать this
///
extension toJsonExtension on Cocktail {
  Map<String, dynamic> toJson() => {
        'idDrink': id,
        'strDrink': name,
        'strInstructions': instruction,
      };
}
