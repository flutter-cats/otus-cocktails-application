import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cocktail_built_value.g.dart';

abstract class Cocktail implements Built<Cocktail, CocktailBuilder> {
  static Serializer<Cocktail> get serializer => _$cocktailSerializer;

  String? get idDrink;
  String? get strDrink;
  String? get strCategory;
  String? get strAlcoholic;
  String? get strGlass;

  Cocktail._();

  factory Cocktail([updates(CocktailBuilder b)]) = _$Cocktail;

  static create() {
    final cocktailBuilder = CocktailBuilder();
    cocktailBuilder.idDrink = '';
    final cocktail = cocktailBuilder.build();
    cocktail.toString();
  }
}
