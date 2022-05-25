import 'package:cocktail_app_tests/core/models.dart';
import 'package:http/http.dart' as http;
import 'async_repository.dart';
import 'mock.dart';
import 'repository_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

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
  });
}