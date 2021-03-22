import 'dart:convert';

import 'package:lesson05async/json/json_serializable_approach/cocktail.dart';

const String httpResponse = '''
{
    "idDrink": "11408",
    "strDrink": "Gin Daisy",
    "strCategory": "Ordinary Drink",
    "strAlcoholic": "Alcoholic",
    "strGlass": "Old-fashioned glass"
}
''';

///
/// show the some model to continue
///
void main() {
  Map<String, dynamic> data = jsonDecode(httpResponse);



  final cocktail = Cocktail.fromJson(data);
  assert(cocktail.id == "11408");
}
