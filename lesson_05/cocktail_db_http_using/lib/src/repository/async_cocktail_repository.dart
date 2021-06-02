import 'dart:convert' as convert;
import 'dart:html';
import 'dart:io';

import 'package:cocktail_app_models/models.dart';
import 'package:cocktail_db_http_using/src/dto/cocktail_definition_dto.dart';
import 'package:cocktail_db_http_using/src/dto/cocktail_dto.dart';
import 'package:cocktail_db_http_using/src/dto/ingredient_dto.dart';
import 'package:cocktail_db_http_using/src/repository/cocktail_error.dart';
import 'package:http/http.dart' as http;

class AsyncCocktailRepository {
  static const String _apiKey =
      'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b';

  static const Map<String, String> _headers = const {
    'x-rapidapi-key': _apiKey,
  };

  Future<Cocktail?> fetchCocktailDetails(String id) async {
    Cocktail? result;

    var client = http.Client();
    try {
      final url = 'https://the-cocktail-db.p.rapidapi.com/lookup.php?i=$id';
      var response = await http.get(Uri.parse(url), headers: _headers);
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

        final dtos = drinks
            .cast<Map<String, dynamic>>()
            .map((json) => CocktailDto.fromJson(json));
        if (dtos.length > 0) {
          result = _createCocktailFromDto(dtos.first);
        }
      } else {
        throw HttpException(
            'Request failed with status: ${response.statusCode}');
      }
    } finally {
      client.close();
    }

    return result;
  }

  Future<Iterable<CocktailDefinition>> fetchCocktailsByCocktailType(
      CocktailType cocktailType) async {
    var result = <CocktailDefinition>[];

    var client = http.Client();
    try {
      final url =
          'https://the-cocktail-db.p.rapidapi.com/filter.php?a=${cocktailType.value}';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'x-rapidapi-key':
              'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

        final dtos = drinks
            .cast<Map<String, dynamic>>()
            .map((json) => CocktailDefinitionDto.fromJson(json));

        for (final dto in dtos) {
          result.add(CocktailDefinition(
            id: dto.idDrink,
            isFavourite: true,
            name: dto.strDrink,
            drinkThumbUrl: dto.strDrinkThumb,
          ));
        }
      } else {
        throw HttpException(
            'Request failed with status: ${response.statusCode}');
      }
    } finally {
      client.close();
    }

    return result;
  }

  Future<Iterable<Cocktail>> fetchPopularCocktails() async {
    var result = <Cocktail>[];

    var client = http.Client();
    try {
      const url = 'https://the-cocktail-db.p.rapidapi.com/popular.php';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'x-rapidapi-key':
              'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

        final dtos = drinks
            .cast<Map<String, dynamic>>()
            .map((json) => CocktailDto.fromJson(json));

        for (final dto in dtos) {
          final cocktail = _createCocktailFromDto(dto);
          result.add(cocktail);
        }
      } else {
        throw HttpException(
            'Request failed with status: ${response.statusCode}');
      }
    } finally {
      client.close();
    }

    return result;
  }

  Future<Cocktail?> getRandomCocktail() async {
    Cocktail? result;

    var client = http.Client();
    try {
      const url = 'https://the-cocktail-db.p.rapidapi.com/random.php';
      var response = await http.get(Uri.parse(url), headers: _headers);
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        var drinks = jsonResponse['drinks'] as Iterable<dynamic>;

        final dtos = drinks
            .cast<Map<String, dynamic>>()
            .map((json) => CocktailDto.fromJson(json));
        if (dtos.length > 0) {
          result = _createCocktailFromDto(dtos.first);
        }
      } else {
        throw HttpException(
            'Request failed with status: ${response.statusCode}');
      }
    } finally {
      client.close();
    }

    return result;
  }

  Future<Ingredient?> lookupIngredientById(String ingredientId) => http
          .get(
              Uri.parse(
                  "https://the-cocktail-db.p.rapidapi.com/lookup.php?=$ingredientId"),
              headers: _headers)
          .then((value) => _handleResponse(value))
          .catchError((exception) {
        _mapInputExceptionToCocktailException(exception.message);
      });

  Ingredient? _handleResponse(http.Response response) {
    Ingredient? ingredient = null;
    if (response.statusCode == HttpStatus.ok) {
      final ingredientsResponse = convert.jsonDecode(response.body);
      final ingredients =
          ingredientsResponse['ingredients'] as Iterable<dynamic>;
      ingredient = _mapDtoToModel(IngredientDto.fromJson(
          ingredients.cast<Map<String, dynamic>>().first));
    } else {
      throw HttpException('Request failed with status: ${response.statusCode}');
    }
    return ingredient;
  }

  CocktailException _mapInputExceptionToCocktailException(String message) =>
      CocktailException(message);

  Cocktail _createCocktailFromDto(CocktailDto dto) {
    final glass = GlassType.parse(dto.strGlass!);
    final cocktailType = CocktailType.parse(dto.strAlcoholic!);
    final category = CocktailCategory.parse(dto.strCategory!);

    var ingredients = <IngredientDefinition>[];

    _getIngredients(dto).forEach(
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

  Map<String, String> _getIngredients(CocktailDto dto) {
    return <String, String>{
      if (dto.strIngredient1 != null) dto.strIngredient1!: dto.strMeasure1!,
      if (dto.strIngredient2 != null) dto.strIngredient2!: dto.strMeasure2!,
      if (dto.strIngredient3 != null) dto.strIngredient3!: dto.strMeasure3!,
      if (dto.strIngredient4 != null) dto.strIngredient4!: dto.strMeasure4!,
      if (dto.strIngredient5 != null) dto.strIngredient5!: dto.strMeasure5!,
      if (dto.strIngredient6 != null) dto.strIngredient6!: dto.strMeasure6!,
      if (dto.strIngredient7 != null) dto.strIngredient7!: dto.strMeasure7!,
      if (dto.strIngredient8 != null) dto.strIngredient8!: dto.strMeasure8!,
      if (dto.strIngredient9 != null) dto.strIngredient9!: dto.strMeasure9!,
      if (dto.strIngredient10 != null) dto.strIngredient10!: dto.strMeasure10!,
      if (dto.strIngredient11 != null) dto.strIngredient11!: dto.strMeasure11!,
      if (dto.strIngredient12 != null) dto.strIngredient12!: dto.strMeasure12!,
      if (dto.strIngredient13 != null) dto.strIngredient13!: dto.strMeasure13!,
      if (dto.strIngredient14 != null) dto.strIngredient14!: dto.strMeasure14!,
      if (dto.strIngredient15 != null) dto.strIngredient15!: dto.strMeasure15!,
    };
  }

  Ingredient _mapDtoToModel(IngredientDto dto) {
    return Ingredient(
      id: dto.idIngredient,
      name: dto.strIngredient,
      description: dto.strDescription,
      ingredientType: dto.strType,
      isAlcoholic: _convertStringToBool(dto.strAlcohol),
    );
  }

  bool _convertStringToBool(String? value) => value == 'true';
}
