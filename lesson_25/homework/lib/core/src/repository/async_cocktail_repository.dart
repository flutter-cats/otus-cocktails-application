import 'dart:convert' as convert;
import 'dart:io';

import 'package:cocktail_app_tests/app_strings.dart';
import 'package:cocktail_app_tests/core/src/dto/cocktail_definition_dto.dart';
import 'package:cocktail_app_tests/core/src/model/ingredient.dart';
import 'package:http/http.dart' as http;

import '../dto/cocktail_dto.dart';
import '../dto/ingredient_dto.dart';
import '../model/cocktail.dart';
import '../model/cocktail_category.dart';
import '../model/cocktail_definition.dart';
import '../model/cocktail_type.dart';
import '../model/glass_type.dart';
import '../model/ingredient_definition.dart';

class AsyncCocktailRepository {
  static const Map<String, String> _headers = const {
    'x-rapidapi-key': AppStrings.apiKey,
  };

  late http.Client client;

  AsyncCocktailRepository({required this.client});

  Future<dynamic> _getApiData(String actionUrl) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final url = '${AppStrings.baseUrl}$actionUrl';
      final response = await client.get(Uri.parse(url), headers: _headers);

      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw HttpException(
            'Request failed with status: ${response.statusCode}');
      }
    } on http.ClientException catch (error) {
      throw HttpException('Request failed with status: $error');
    } on SocketException catch (_) {
      print('Проблемы с соединением');
    } catch (_) {
      throw HttpException('Request failed');
    } finally {
      //client.close();
    }
  }

  Future<Cocktail?> fetchCocktailDetails(String id) async {
    Cocktail? result;

    var jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailDetailsUrl}?${AppStrings.cocktailIdParameter}=$id');

    var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));
    if (dtos.length > 0) {
      result = createCocktailFromDto(dtos.first);
    }
    return result;
  }

  Future<Iterable<CocktailDefinition>> fetchCocktailsByCocktailType(
      CocktailType cocktailType) async {
    var result = <CocktailDefinition>[];

    var jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailsByCocktailTypeUrl}?${AppStrings.cocktailTypeParameter}=${cocktailType.name}');

    var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDefinitionDto.fromJson(json));

    for (final dto in dtos) {
      result.add(
        CocktailDefinition(
          id: dto.idDrink,
          isFavourite: true,
          name: dto.strDrink,
          drinkThumbUrl: dto.strDrinkThumb,
        ),
      );
    }
    return result;
  }

  Future<Iterable<CocktailDefinition?>> fetchCocktailsByCocktailCategory(
      CocktailCategory category) async {
    var result = <CocktailDefinition>[];

    var jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailsByCocktailCategoryUrl}?${AppStrings.cocktailCategoryParameter}=${category.name}');

    var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDefinitionDto.fromJson(json));

    for (final dto in dtos) {
      result.add(CocktailDefinition(
        id: dto.idDrink,
        isFavourite: false,
        name: dto.strDrink,
        drinkThumbUrl: dto.strDrinkThumb,
      ));
    }

    return result;
  }

  Future<Iterable<Cocktail>> fetchPopularCocktails() async {
    var result = <Cocktail>[];

    var jsonResponse = await _getApiData(AppStrings.fetchPopularCocktailsUrl);

    var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));

    for (final dto in dtos) {
      final cocktail = createCocktailFromDto(dto);
      result.add(cocktail);
    }

    return result;
  }

  Future<Cocktail?> getRandomCocktail() async {
    Cocktail? result;

    var jsonResponse = await _getApiData(AppStrings.getRandomCocktailUrl);
    var drinks = jsonResponse['drinks'] as Iterable<dynamic>;
    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));
    if (dtos.length > 0) {
      result = createCocktailFromDto(dtos.first);
    }
    return result;
  }

  Future<Ingredient?> lookupIngredientById(String iid) async {
    Ingredient? result;

    var jsonResponse = await _getApiData(
        '${AppStrings.lookupIngredientByIdUrl}?${AppStrings.ingredientIdParameter}=$iid');

    var ingredients = jsonResponse['ingredients'] as Iterable<dynamic>;

    final dtos = ingredients
        .cast<Map<String, dynamic>>()
        .map((json) => IngredientDto.fromJson(json));
    if (dtos.length > 0) {
      result = createIngredientFromDto(dtos.first);
    }

    return result;
  }

  Ingredient createIngredientFromDto(IngredientDto dto) => Ingredient(
        id: dto.idIngredient,
        name: dto.strIngredient,
        description: dto.strDescription,
        ingredientType: dto.strType,
        isAlcoholic: dto.isAlcoholic,
        abv: dto.strABV,
      );

  Cocktail createCocktailFromDto(CocktailDto dto) {
    final glass = GlassType.parse(dto.strGlass!);
    final cocktailType = CocktailType.parse(dto.strAlcoholic!);
    final category = CocktailCategory.parse(dto.strCategory!);

    var ingredients = <IngredientDefinition>[];

    getIngredients(dto).forEach(
        (key, value) => ingredients.add(IngredientDefinition(key, value)));

    return Cocktail(
      id: dto.idDrink,
      category: category,
      cocktailType: cocktailType,
      glassType: glass,
      instruction: dto.strInstructions,
      isFavourite: true,
      name: dto.strDrink,
      ingredients: ingredients,
      drinkThumbUrl: dto.strDrinkThumb,
    );
  }

  Map<String, String> getIngredients(CocktailDto dto) {
    return <String, String>{
      if (dto.strIngredient1 != null)
        dto.strIngredient1!: dto.strMeasure1 ?? '-',
      if (dto.strIngredient2 != null)
        dto.strIngredient2!: dto.strMeasure2 ?? '-',
      if (dto.strIngredient3 != null)
        dto.strIngredient3!: dto.strMeasure3 ?? '-',
      if (dto.strIngredient4 != null)
        dto.strIngredient4!: dto.strMeasure4 ?? '-',
      if (dto.strIngredient5 != null)
        dto.strIngredient5!: dto.strMeasure5 ?? '-',
      if (dto.strIngredient6 != null)
        dto.strIngredient6!: dto.strMeasure6 ?? '-',
      if (dto.strIngredient7 != null)
        dto.strIngredient7!: dto.strMeasure7 ?? '-',
      if (dto.strIngredient8 != null)
        dto.strIngredient8!: dto.strMeasure8 ?? '-',
      if (dto.strIngredient9 != null)
        dto.strIngredient9!: dto.strMeasure9 ?? '-',
      if (dto.strIngredient10 != null)
        dto.strIngredient10!: dto.strMeasure10 ?? '-',
      if (dto.strIngredient11 != null)
        dto.strIngredient11!: dto.strMeasure11 ?? '-',
      if (dto.strIngredient12 != null)
        dto.strIngredient12!: dto.strMeasure12 ?? '-',
      if (dto.strIngredient13 != null)
        dto.strIngredient13!: dto.strMeasure13 ?? '-',
      if (dto.strIngredient14 != null)
        dto.strIngredient14!: dto.strMeasure14 ?? '-',
      if (dto.strIngredient15 != null)
        dto.strIngredient15!: dto.strMeasure15 ?? '-',
    };
  }
}
