import 'package:cocktail_app_tests/core/models.dart';
import 'package:http/http.dart' as http;
import 'async_repository.dart';
import 'mock.dart';
import 'repository_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  AsyncRepository repository = AsyncRepository(client: client);

  group('Repo group test', () {

    test('Lookup cocktail should return Cocktail', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/lookup.php?i=1'), headers: headers))
          .thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktail = await repository.fetchCocktailDetails('1');
      expect(cocktail, isA<Cocktail>());
    });

    test('Should caught an exception', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/lookup.php?i=1'), headers: headers))
          .thenAnswer((_) async => http.Response('Not found', 404));
      expect(repository.fetchCocktailDetails('1'), throwsException);
    });

    test('Should be find by beer an iterable of CocktailDefinition', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/filter.php?c=Beer'), headers: headers))
          .thenAnswer((_) async => http.Response(mockDefinitions, 200));
      final definitions = await repository.fetchCocktailsByCocktailCategory(CocktailCategory.beer);
      expect(definitions, isA<Iterable<CocktailDefinition>>());
    });

    test('Should be find by alcoholic type an iterable of CocktailDefinition', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/filter.php?a=Alcoholic'), headers: headers))
          .thenAnswer((_) async => http.Response(mockDefinitions, 200));
      final definitions = await repository.fetchCocktailsByCocktailType(CocktailType.alcoholic);
      expect(definitions, isA<Iterable<CocktailDefinition>>());
    });
    
    test('Should find iterable of popular cocktails', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/popular.php'), headers: headers))
          .thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktails = await repository.fetchPopularCocktails();
      expect(cocktails, isA<Iterable<Cocktail>>());
    });

    test('Random cocktail should be a Cocktail', () async {
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/random.php'), headers: headers))
          .thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktail = await repository.getRandomCocktail();
      expect(cocktail, isA<Cocktail>());
    });
  });
}