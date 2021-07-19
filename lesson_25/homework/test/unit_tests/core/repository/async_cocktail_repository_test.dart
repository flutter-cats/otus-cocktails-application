@TestOn('chrome')
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:http/http.dart' as http;
import 'async_cocktail_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const expectedId = '15300';
  final cocktail = Cocktail(
      id: expectedId,
      glassType: GlassType.collinsGlass,
      cocktailType: CocktailType.alcoholic,
      category: CocktailCategory.ordinaryDrink,
      isFavourite: false,
      ingredients: [],
      instruction: '',
      name: '',
      drinkThumbUrl: '');

  late MockClient httpClientMock;
  late AsyncCocktailRepository asyncRepository;
  const String _apiKey =
      'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b';

  const Map<String, String> _headers = const {
    'x-rapidapi-key': _apiKey,
  };
  setUp(() {
    httpClientMock = MockClient();
    asyncRepository = AsyncCocktailRepository(httpClientMock);
  });

  group('Fetch coctail details method should return ', () {
    test('True if async repository is answered with Ok', () async {
      final response = '{"drinks":[{"idDrink":"15300","strDrink":"","strCategory":"Ordinary Drink",'
          '"strAlcoholic":"Alcoholic","strGlass":"Collins Glass","strInstructions":"","strDrinkThumb":""}]}';

      when(httpClientMock.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/lookup.php?i=$expectedId'), headers: _headers))
          .thenAnswer((_) async => http.Response(response, 200));

      final cocktailResult = await asyncRepository.fetchCocktailDetails(expectedId);
      expect(cocktailResult, isA<Cocktail>());
      expect(cocktailResult, CocktailMatcher(cocktail));
    });

    test('False if async repository is answered with Error', () async {
      when(httpClientMock.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/lookup.php?i=$expectedId'), headers: _headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(asyncRepository.fetchCocktailDetails(expectedId), throwsException);
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

    if (item.instruction != _expected.instruction) {
      _mismatchDescriptionList.add(formatFieldMatchError('cocktail instruction',
          '${_expected.instruction}', '${item.instruction}'));
    }
    return _mismatchDescriptionList.isEmpty;
  }
}
