import 'package:meta/meta.dart';

class IngradientCocktail {
  IngradientCocktail(
      {@required String measure,
      @required String ingredient}) {
        _measure = measure;
        _ingredient = ingredient;
      }

  String _measure,
      _ingredient;

  String get measure => _measure;
  String get ingredient => _ingredient;
}
