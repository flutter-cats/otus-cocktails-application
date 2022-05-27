import 'dart:io';

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

  group('Initializer', () {
    test('init with standart client', () {
      final repository = AsyncCocktailRepository(
          delayDuration: 0, baseURL: "http://localhost1");
      expect(repository.baseURL, "http://localhost1");
      expect(repository.delayDuration, 0);
    });
  });

  group('fetchCocktailDetails', () {
    test('returns a Cocktail', () async {
      const id = "17060";
      when(
        _client.get(
          Uri.parse('http://localhost/lookup.php?i=$id'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_cocktail_details, 200),
      );
      var cocktail = await _repository.fetchCocktailDetails(id);
      expect(cocktail, isNotNull);
      expect(cocktail!.id, id);
      expect(cocktail, isA<Cocktail>());
    });

    test('returns an empty response', () async {
      const id = "17060";
      when(
        _client.get(
          Uri.parse('http://localhost/lookup.php?i=foobar'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 200),
      );
      expect(
        _repository.fetchCocktailDetails("foobar"),
        throwsA(isA<FormatException>()),
      );
    });

    test('request fails', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/lookup.php?i=1'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        _repository.fetchCocktailDetails("1"),
        throwsA(isA<HttpException>()),
      );
    });
  });

  group('fetchCocktailsByCocktailCategory', () {
    test('returns CocktailDefinition Iterable', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/filter.php?c=Cocktail'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_cocktailsBycategory, 200),
      );

      expect(
          await _repository
              .fetchCocktailsByCocktailCategory(CocktailCategory.cocktail),
          isA<Iterable<CocktailDefinition>>());
    });

    test('request fails', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/filter.php?c=Cocktail'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        _repository.fetchCocktailsByCocktailCategory(CocktailCategory.cocktail),
        throwsA(isA<HttpException>()),
      );
    });
  });

  group('getRandomCocktail', () {
    test('returns a Cocktail', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/random.php'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_cocktail_details, 200),
      );
      var cocktail = await _repository.getRandomCocktail();
      expect(cocktail, isNotNull);
      expect(cocktail, isA<Cocktail>());
    });

    test('request fails', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/random.php'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        _repository.getRandomCocktail(),
        throwsA(isA<HttpException>()),
      );
    });
  });

  group('fetchPopularCocktails', () {
    test('returns an iterable Cocktail', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/popular.php'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_popularCokctails, 200),
      );
      final cocktails = await _repository.fetchPopularCocktails();
      // expect(cocktails, isNotNull);
      expect(cocktails, isA<Iterable<Cocktail>>());
    });

    test('request fails', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/popular.php'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        _repository.fetchPopularCocktails(),
        throwsA(isA<HttpException>()),
      );
    });
  });

  group('fetchCocktailsByCocktailType', () {
    test('returns an iterable CocktailDefinition', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/filter.php?a=Alcoholic'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response(json_dump_cocktailsBycategory, 200),
      );
      final cocktails = await _repository
          .fetchCocktailsByCocktailType(CocktailType.alcoholic);
      expect(cocktails, isNotNull);
      expect(cocktails, isA<Iterable<CocktailDefinition>>());
    });

    test('request fails', () async {
      when(
        _client.get(
          Uri.parse('http://localhost/filter.php?a=Alcoholic'),
          headers: _headers,
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        _repository.fetchCocktailsByCocktailType(CocktailType.alcoholic),
        throwsA(isA<HttpException>()),
      );
    });
  });
}
