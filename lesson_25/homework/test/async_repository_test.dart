
import 'dart:async';

import 'package:cocktail_app_tests/core/models.dart';
import 'package:fake_async/fake_async.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {

  group('async repository test',() {

    final repository = AsyncCocktailRepository();

    test('random cocktail returned', () async {

      final randomed = await repository.getRandomCocktail();

      expect(randomed != null, true);

    });

    test('fetch popular cocktails by users', () async {

      final cocktails = await repository.fetchPopularCocktails();

      expect(cocktails.isNotEmpty, true);
    });

    test('get cocktail by valid id', () async {
      final validId = '552';

      final cocktail = await repository.fetchCocktailDetails(validId);

      expect(cocktail != null, true);
      //fail because of mapper -_-
    });

    test('get cocktail by invalid id', () async {
      final invalidId = 'ashjdb123';

      final cocktail = await repository.fetchCocktailDetails(invalidId);

      expect(cocktail == null, true);
      //fail because of error in json decoding
    });

    test('fetch cocktails by category', () async {
      final category = CocktailCategory.beer;

      //just for lulz
      fakeAsync((async) {
        expect(new Completer().future.timeout(new Duration(seconds: 5)),
            throwsA(new isInstanceOf<TimeoutException>()));

        async.elapse(Duration(seconds: 5));
      });
      final cocktails = await repository.fetchCocktailsByCocktailCategory(category);

      expect(cocktails.isNotEmpty, true);
    });

    test('fetch cocktails by type', () async {
      final type = CocktailType.alcoholic;

      final cocktails = await repository.fetchCocktailsByCocktailType(type);

      expect(cocktails.isNotEmpty, true);
    });
  });
}