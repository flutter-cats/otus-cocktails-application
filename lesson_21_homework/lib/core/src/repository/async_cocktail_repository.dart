import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../app/app_strings.dart';
import '../../models.dart';
import '../dto/ingredient_dto.dart';

class AsyncCocktailRepository {
  static const Map<String, String> _headers = {
    'x-rapidapi-key': AppStrings.apiKey,
  };

  Future<dynamic> _getApiData(String actionUrl) async {
    final client = http.Client();

    try {
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
      throw ('Проблемы с соединением');
    } catch (_) {
      throw ('Что-то пошло не так');
    } finally {
      client.close();
    }
  }

  Future<Cocktail?> fetchCocktailDetails(String id) async {
    Cocktail? result;

    final jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailDetailsUrl}?${AppStrings.cocktailIdParameter}=$id');

    final drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));
    if (dtos.isNotEmpty) {
      result = _createCocktailFromDto(dtos.first);
    }
    return result;
  }

  Future<Iterable<CocktailDefinition>> fetchCocktailsByCocktailType(
      CocktailType cocktailType) async {
    final result = <CocktailDefinition>[];

    final jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailsByCocktailTypeUrl}?${AppStrings.cocktailTypeParameter}=${cocktailType.value}');

    final drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDefinitionDto.fromJson(json));

    for (final dto in dtos) {
      result.add(
        CocktailDefinition(
          id: dto.idDrink,
          name: dto.strDrink,
          drinkThumbUrl: dto.strDrinkThumb,
        ),
      );
    }
    return result;
  }

  Future<Iterable<CocktailDefinition>> fetchCocktailsByCocktailCategory(
      CocktailCategory category) async {
    final result = <CocktailDefinition>[];

    final jsonResponse = await _getApiData(
        '${AppStrings.fetchCocktailsByCocktailCategoryUrl}?${AppStrings.cocktailCategoryParameter}=${category.value}');

    if (jsonResponse['drinks'] == 'None Found') {
      throw 'Не найдено подходящих коктейлей';
    }

    final drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDefinitionDto.fromJson(json));

    for (final dto in dtos) {
      result.add(CocktailDefinition(
        id: dto.idDrink,
        name: dto.strDrink,
        drinkThumbUrl: dto.strDrinkThumb,
      ));
    }

    return result;
  }

  Future<Iterable<Cocktail>> fetchPopularCocktails() async {
    final result = <Cocktail>[];

    final jsonResponse = await _getApiData(AppStrings.fetchPopularCocktailsUrl);

    final drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));

    for (final dto in dtos) {
      final cocktail = _createCocktailFromDto(dto);
      result.add(cocktail);
    }

    return result;
  }

  Future<Cocktail?> getRandomCocktail() async {
    Cocktail? result;

    final jsonResponse = await _getApiData(AppStrings.getRandomCocktailUrl);

    final drinks = jsonResponse['drinks'] as Iterable<dynamic>;

    final dtos = drinks
        .cast<Map<String, dynamic>>()
        .map((json) => CocktailDto.fromJson(json));
    if (dtos.isNotEmpty) {
      result = _createCocktailFromDto(dtos.first);
    }

    return result;
  }

  Future<Ingredient?> lookupIngredientById(String iid) async {
    Ingredient? result;

    final jsonResponse = await _getApiData(
        '${AppStrings.lookupIngredientByIdUrl}?${AppStrings.ingredientIdParameter}=$iid');

    final ingredients = jsonResponse['ingredients'] as Iterable<dynamic>;

    final dtos = ingredients
        .cast<Map<String, dynamic>>()
        .map((json) => IngredientDto.fromJson(json));
    if (dtos.isNotEmpty) {
      result = _createIngredientFromDto(dtos.first);
    }

    return result;
  }

  Ingredient _createIngredientFromDto(IngredientDto dto) => Ingredient(
        id: dto.idIngredient,
        name: dto.strIngredient,
        description: dto.strDescription,
        ingredientType: dto.strType,
        isAlcoholic: dto.isAlcoholic,
        abv: dto.strABV,
      );

  Cocktail _createCocktailFromDto(CocktailDto dto) {
    final glass = GlassType.parse(dto.strGlass);
    final cocktailType = CocktailType.parse(dto.strAlcoholic);
    final category = CocktailCategory.parse(dto.strCategory);

    final ingredients = <IngredientDefinition>[];

    _getIngredients(dto).forEach(
        (key, value) => ingredients.add(IngredientDefinition(key, value)));

    return Cocktail(
      id: dto.idDrink,
      category: category,
      cocktailType: cocktailType,
      glassType: glass,
      instruction: dto.strInstructions,
      name: dto.strDrink,
      ingredients: ingredients,
      drinkThumbUrl: dto.strDrinkThumb,
    );
  }

  Map<String, String> _getIngredients(CocktailDto dto) {
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

  Future<Iterable<CocktailDefinition>> getFavouriteCocktails() {
    return fetchCocktailsByCocktailType(CocktailType.optionalAlcohol);
  }
}
