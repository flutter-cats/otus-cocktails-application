import 'dart:io';

@TestOn('vm')
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:cocktail_app_tests/core/models.dart';

import 'async_cocktail_repository_test.mocks.dart';

@GenerateMocks([AsyncCocktailRepository])
void main() {
  late MockAsyncCocktailRepository asyncCocktailRepositoryMock;
  const expectedId = 'expected id';
  final cocktail = Cocktail(
      id: expectedId,
      glassType: null,
      cocktailType: null,
      category: null,
      isFavourite: null,
      ingredients: null,
      instruction: '',
      name: '',
      drinkThumbUrl: '');

  final exception = HttpException('test');

  setUp(() {
    asyncCocktailRepositoryMock = MockAsyncCocktailRepository();
  });

  group('Fetch coctail details method should return ', () {
    test('True if async repository is answered with Ok', () async {
      when(asyncCocktailRepositoryMock.fetchCocktailDetails(expectedId))
          .thenAnswer((realInvocation) => Future.value(cocktail));

      final actualOperationResult =
          await asyncCocktailRepositoryMock.fetchCocktailDetails(expectedId);
      expect(actualOperationResult, cocktail);
    });

    test('False if async repository is answered with Error', () async {
      when(asyncCocktailRepositoryMock.fetchCocktailDetails(expectedId))
          .thenAnswer((_) async => throw exception);

      expect(asyncCocktailRepositoryMock.fetchCocktailDetails(expectedId),
          throwsException);
    });
  });
}

class CocktailMatcher extends Matcher {
  final Cocktail _expected;
  final List<String> _mismatchDescriptionList = [];

  CocktailMatcher(this._expected) : super();

  @override
  Description describe(Description description) =>
      description.addDescriptionOf(_expected);

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      mismatchDescription.addDescriptionOf(_expected).replace(
            _mismatchDescriptionList.join(),
          );

  String formatFieldMatchError(
          String fieldName, String expectedValue, String actualValue) =>
      '\n Cocktail.$fieldName should be equal \'$expectedValue\', but \'$actualValue\' found;';

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! Cocktail) {
      return false;
    }

    if (item.id != _expected.id) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail id', '${_expected.id}', '${item.id}'));
    }

    if (item.drinkThumbUrl != _expected.drinkThumbUrl) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail drinkThumbUrl',
          '${_expected.drinkThumbUrl}',
          '${item.drinkThumbUrl}'));
    }

    if (item.name != _expected.name) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail name', '${_expected.name}', '${item.name}'));
    }

    if (item.glassType != _expected.glassType) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail glassType', '${_expected.glassType}', '${item.glassType}'));
    }

    if (item.cocktailType != _expected.cocktailType) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail cocktailType',
          '${_expected.cocktailType}',
          '${item.cocktailType}'));
    }
    if (item.category != _expected.category) {
      _mismatchDescriptionList.add(formatFieldMatchError(
          'cocktail category', '${_expected.category}', '${item.category}'));
    }

    if (item.isFavourite != _expected.isFavourite) {
      _mismatchDescriptionList.add(formatFieldMatchError('cocktail isFavourite',
          '${_expected.isFavourite}', '${item.isFavourite}'));
    }
    if (item.ingredients != _expected.ingredients) {
      _mismatchDescriptionList.add(formatFieldMatchError('cocktail ingredients',
          '${_expected.ingredients}', '${item.ingredients}'));
    }

    if (item.instruction != _expected.instruction) {
      _mismatchDescriptionList.add(formatFieldMatchError('cocktail instruction',
          '${_expected.instruction}', '${item.instruction}'));
    }
    return _mismatchDescriptionList.isEmpty;
  }
}
