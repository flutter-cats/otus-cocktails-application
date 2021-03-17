
import 'package:meta/meta.dart';

class CocktailDefinition {
  final String? id;
  final String? name;
  final String? drinkThumbUrl;
  final bool? isFavourite;

  CocktailDefinition({
    @required this.id,
    @required this.name,
    @required this.drinkThumbUrl,
    @required this.isFavourite,
  });
}
