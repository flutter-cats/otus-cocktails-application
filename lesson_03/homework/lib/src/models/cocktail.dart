import 'package:meta/meta.dart';
import 'package:homework/models.dart';

class Cocktail {
  final String id, category, coctailType, glass, videoUrl, thumbUrl;
  String _lang;

  Map<String, String> _name, _instructions;
  final DateTime dateModified;
  final List<IngradientCocktail> ingredients;

  Cocktail({
    @required this.id,
    @required String lang,
    @required name,
    @required this.dateModified,
    @required this.category,
    @required this.coctailType,
    @required instructions,
    @required this.glass,
    @required this.ingredients,
    this.thumbUrl = '',
    this.videoUrl = '',
  }) {
    _lang = lang;
    _name = name;
    _instructions = instructions;
  }

  String get instructions => '${_instructions[_lang]}';
  String get lang => _lang;

  set lang(value) => _lang = value;
  String get name => '${_name[_lang]}';

  @override
  String toString() {
    var string = '';
    string = 'Cocktail\n'
        '  |-- lang: ${_lang}\n'
        '  |-- id: ${id}\n'
        '  |-- name: ${name}\n'
        '  |-- dateModified: ${dateModified}\n'
        '  |-- instructions ${instructions}\n'
        '  |-- glass: ${glass}\n'
        '  |-- thumbUrl: ${thumbUrl}\n'
        '  |-- videoUrl: ${videoUrl}\n'
        '  |-- ingradients:\n';
    for (var ingredient in ingredients) {
      string += '  |-- ingradient:\n'
          '    |---- ingradient.measure: ${ingredient.measure}\n'
          '    |---- ingradient.ingredient: ${ingredient.ingredient}\n';
    }
    return string;
  }
}
