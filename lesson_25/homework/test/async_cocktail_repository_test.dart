import 'package:cocktail_app_tests/core/models.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'async_cocktail_repository_test.mocks.dart';
import 'mock_dumps.dart';

@GenerateMocks([http.Client])
void main() {
  late AsyncCocktailRepository _repository;
  late final Map<String, String> _headers;
  late final MockClient _client;

  setUpAll(() {
    _client = MockClient();
    _repository = AsyncCocktailRepository(
      client: _client,
      baseURL: "http://localhost",
      apiKey: "test",
      delayDuration: 0,
    );

    _headers = {'x-rapidapi-key': 'test'};
  });

  group('fetchCocktailDetails', () {
    test('returns a Cocktail if the http call completes successfully',
        () async {
      when(
        _client.get(
          Uri.parse('http://localhost/lookup.php?i=1'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_cocktail_details, 200),
      );

      expect(await _repository.fetchCocktailDetails("1"), isA<Cocktail>());
    });
  });
}
