import 'package:cocktail_app_models/cocktail_app_models.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Cocktail cocktail;

    setUp(() {
      cocktail = Cocktail();
    });

    test('First Test', () {
      expect(cocktail.strDrink, null);
    });
  });
}
