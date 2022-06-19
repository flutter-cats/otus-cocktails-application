import 'dart:convert';
import 'dart:io';

import 'package:cocktail_app_tests/app_strings.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'async_cocktail_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late AsyncCocktailRepository asyncCocktailRepository;

  const Map<String, String> headers = const {
    'x-rapidapi-key': AppStrings.apiKey,
  };

  setUp(() {
    mockClient = MockClient();
    asyncCocktailRepository = AsyncCocktailRepository(client: mockClient);
  });

  group('Async cocktail repository test', () {
    test('Fetch cocktail details by id', () async {
      final mockCocktail =
          File('test/helper/dummy/dummy_cocktail.json').readAsStringSync();
      when(
        mockClient.get(
            Uri.parse(
                '${AppStrings.baseUrl}${AppStrings.fetchCocktailDetailsUrl}?${AppStrings.cocktailIdParameter}=100'),
            headers: headers),
      ).thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktail =
          await asyncCocktailRepository.fetchCocktailDetails('100');
      expect(cocktail, isA<Cocktail>());
    });

    test('Fetch cocktail details by id not found exception', () async {
      when(
        mockClient.get(
            Uri.parse(
                '${AppStrings.baseUrl}${AppStrings.fetchCocktailDetailsUrl}?${AppStrings.cocktailIdParameter}=10'),
            headers: headers),
      ).thenAnswer((_) async => http.Response('Not found', 404));
      expect(
          asyncCocktailRepository.fetchCocktailDetails('10'), throwsException);
    });

    test('Fetch cocktails by cocktail type', () async {
      final mockCocktailDefinition =
          File('test/helper/dummy/dummy_cocktail_definition.json')
              .readAsStringSync();
      when(
        mockClient.get(
            Uri.parse(
                '${AppStrings.baseUrl}${AppStrings.fetchCocktailsByCocktailTypeUrl}?${AppStrings.cocktailTypeParameter}=alcoholic'),
            headers: headers),
      ).thenAnswer((_) async => http.Response(mockCocktailDefinition, 200));
      final cocktail = await asyncCocktailRepository
          .fetchCocktailsByCocktailType(CocktailType.alcoholic);
      expect(cocktail, isA<List<CocktailDefinition>>());
    });

    test('Fetch cocktails by cocktail category', () async {
      final mockCocktailDefinition =
          File('test/helper/dummy/dummy_cocktail_definition.json')
              .readAsStringSync();
      when(
        mockClient.get(
            Uri.parse(
                '${AppStrings.baseUrl}${AppStrings.fetchCocktailsByCocktailCategoryUrl}?${AppStrings.cocktailCategoryParameter}=cocktail'),
            headers: headers),
      ).thenAnswer((_) async => http.Response(mockCocktailDefinition, 200));
      final cocktail = await asyncCocktailRepository
          .fetchCocktailsByCocktailCategory(CocktailCategory.cocktail);
      expect(cocktail, isA<List<CocktailDefinition>>());
    });

    test('Fetch popular cocktails', () async {
      final mockCocktail =
          File('test/helper/dummy/dummy_cocktail.json').readAsStringSync();
      when(mockClient.get(
              Uri.parse(
                  '${AppStrings.baseUrl}${AppStrings.fetchPopularCocktailsUrl}'),
              headers: headers))
          .thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktail = await asyncCocktailRepository.fetchPopularCocktails();
      expect(cocktail, isA<List<Cocktail>>());
    });

    test('Random cocktail is a Cocktail', () async {
      final mockCocktail =
          File('test/helper/dummy/dummy_cocktail.json').readAsStringSync();
      when(mockClient.get(
              Uri.parse(
                  '${AppStrings.baseUrl}${AppStrings.getRandomCocktailUrl}'),
              headers: headers))
          .thenAnswer((_) async => http.Response(mockCocktail, 200));
      final cocktail = await asyncCocktailRepository.getRandomCocktail();
      expect(cocktail, isA<Cocktail>());
    });

    test('Random cocktail error', () async {
      when(mockClient.get(
              Uri.parse(
                  '${AppStrings.baseUrl}${AppStrings.getRandomCocktailUrl}'),
              headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expectLater(asyncCocktailRepository.getRandomCocktail(), throwsException);
    });

    test('Get ingredient by id', () async {
      final mockCocktailDefinition =
          File('test/helper/dummy/dummy_ingredient.json').readAsStringSync();
      when(
        mockClient.get(
            Uri.parse(
                '${AppStrings.baseUrl}${AppStrings.lookupIngredientByIdUrl}?${AppStrings.ingredientIdParameter}=100'),
            headers: headers),
      ).thenAnswer((_) async => http.Response(mockCocktailDefinition, 200));
      final cocktail =
          await asyncCocktailRepository.lookupIngredientById('100');
      expect(cocktail, isA<Ingredient>());
    });

    group('DTO to Model test', () {
      test('Ingredient DTO to Model', () async {
        final Ingredient testIngredient = Ingredient(
          id: '100',
          name: 'Cherry Brandy',
          description: null,
          ingredientType: 'Liquer',
          isAlcoholic: true,
          abv: null,
        );

        final mockIngredientDefinition =
            File('test/helper/dummy/dummy_ingredient.json').readAsStringSync();
        when(
          mockClient.get(
              Uri.parse(
                  '${AppStrings.baseUrl}${AppStrings.lookupIngredientByIdUrl}?${AppStrings.ingredientIdParameter}=100'),
              headers: headers),
        ).thenAnswer((_) async => http.Response(mockIngredientDefinition, 200));
        final cocktail =
            await asyncCocktailRepository.lookupIngredientById('100');
        expect(cocktail, equals(testIngredient));
      });

      test('Cocktail DTO to Model', () async {
        final Cocktail testCocktail = Cocktail(
          id: '17222',
          name: 'A1',
          drinkThumbUrl:
              'https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg',
          isFavourite: true,
          instruction:
              'Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.',
          category: CocktailCategory.cocktail,
          glassType: GlassType.cocktailGlass,
          cocktailType: CocktailType.alcoholic,
          ingredients: [
            IngredientDefinition('Gin', '1 3/4 shot '),
            IngredientDefinition('Grand Marnier', '1 Shot '),
            IngredientDefinition('Lemon Juice', '1/4 Shot'),
            IngredientDefinition('Grenadine', '1/8 Shot'),
          ],
        );

        final mockCocktailDefinition =
            File('test/helper/dummy/dummy_cocktail.json').readAsStringSync();
        when(
          mockClient.get(
              Uri.parse(
                  '${AppStrings.baseUrl}${AppStrings.getRandomCocktailUrl}'),
              headers: headers),
        ).thenAnswer((_) async => http.Response(mockCocktailDefinition, 200));
        final cocktail = await asyncCocktailRepository.getRandomCocktail();
        expect(cocktail, equals(testCocktail));
      });
    });
  });
}
