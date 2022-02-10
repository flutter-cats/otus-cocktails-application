import 'package:homework/adapters.dart';
import 'package:homework/mocks.dart';

void main() {
  var cocktail = adaptCoctail(
    json: mockCocktail,
  );

  print(cocktail.toString());
  print('--------------------------------------------------------\n');
  cocktail.lang = 'de';
  print(cocktail.toString());
}
