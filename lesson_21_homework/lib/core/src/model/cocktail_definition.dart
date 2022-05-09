
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

  //чтобы быстрее, по хорошему нужно сделать через CocktailDefinitionDto
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'drinkThumbUrl': drinkThumbUrl,
  };

  CocktailDefinition.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        drinkThumbUrl = json['drinkThumbUrl'],
        isFavourite = true;
}
