import 'package:cocktail_app_tests/core/models.dart';
import 'package:http/http.dart' as http;
import 'mock.dart';
import 'repository_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  AsyncCocktailRepository repository = AsyncCocktailRepository();
  group('Repo group test', () {
    test('Lookup cocktail should return Cocktail', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://the-cocktail-db.p.rapidapi.com/lookup.php?i=1')))
          .thenAnswer((_) async => http.Response('{"drinks":[]}', 200));
      expect(await repository.fetchCocktailDetails('1'), isA<Cocktail>());
    });

  });
}