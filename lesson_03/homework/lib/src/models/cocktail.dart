import 'package:meta/meta.dart';
import './ingredient_cocktail.dart';

class Cocktail {
  Cocktail(
      {@required String id,
      @required String lang,
      @required Map<String, String> name,
      @required DateTime dateModified,
      @required String category,
      @required String coctailType,
      @required Map<String, String> instructions,
      @required String glass,
      @required List<IngradientCocktail> ingredients,
      thumbUrl = '',
      videoUrl = ''}) {
        _id = id;
        _lang = lang;
        _name = name;
        _dateModified = dateModified;
        _category = category;
        _coctailType = coctailType;
        _instructions = instructions;
        _glass = glass;
        _ingredients = ingredients;
        _thumbUrl = thumbUrl;
        _videoUrl = videoUrl;
      }

  String _id,
      _lang,
      _category,
      _coctailType,
      _glass,
      _videoUrl,
      _thumbUrl;
  Map<String, String> _name, _instructions;
  DateTime _dateModified;
  List<IngradientCocktail> _ingredients;

	set lang(value) => _lang = value;

  String get id => _id;
  String get lang => _lang;
  String get name => _name[_lang] != Null ? _name[_lang] : '';
  DateTime get dateModified => _dateModified;
  String get category => _category;
  String get coctailType => _coctailType;
  String get instructions =>
    _instructions[_lang] != Null ? _instructions[_lang] : '';
  String get glass => _glass;
  List<IngradientCocktail> get ingredients => _ingredients;
  String get thumbUrl => _thumbUrl;
  String get videoUrl => _videoUrl;
}
