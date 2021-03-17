import 'dart:convert';

import 'package:lesson05async_freezed/json/freezed/cocktail.dart';

const String httpResponse = '''
{
    "id": "11408",
    "drink": "Gin Daisy",
    "category": "Ordinary Drink",
    "alcoholic": "Alcoholic",
    "strGlass": "Old-fashioned glass"
}
''';

void main() {
  Map<String, dynamic> data = jsonDecode(httpResponse);

  final cocktail = Cocktail.fromJson(data);
  final map = cocktail.toJson();
  assert(cocktail.id == "11408");
  assert(map.containsKey('strGlass'));
}
