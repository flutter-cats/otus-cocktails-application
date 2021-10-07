import 'package:cocktail_app_models/models.dart';
import 'package:cocktail_db_http_using/src/dto/cocktail_dto.dart';
import 'package:cocktail_db_http_using/src/repository/coctail_api_service.dart';
import 'package:cocktail_db_http_using/src/dto/ingridient_dto.dart';
import 'package:cocktail_app_models/src/model/cocktail.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:async';

class AppRepository {
  static const API_KEY = 'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b';

  late CoctailApiService _apiService;
  Dio dio = Dio();
  CocktailMapper _mapper = CocktailMapper();

  AppRepository() {
    dio = Dio();
    dio.options.headers['x-rapidapi-key'] = API_KEY;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        compact: true,
        maxWidth: 90));
    _apiService = CoctailApiService(dio);
  }

  Future<Iterable<Cocktail>> getPopularCocktails() async {
    var result = <Cocktail>[];
    final response = await _apiService.getPopularCoctails();
    if (response.drinks.length > 0) {
      response.drinks
          .map((e) => _mapper.createCocktailFromDto(e))
          .forEach((element) {
        result.add(element);
      });
    }
    return result;
  }

  Future<Cocktail?> getRandomCocktail() async {
    Cocktail? result;
    final response = await _apiService.getRandomCoctail();
    if (response.drinks.length > 0) {
      result = _mapper.createCocktailFromDto(response.drinks.first);
    }
    return result;
  }

  Future<Cocktail?> findCocktailById(String id) async {
    Cocktail? result;
    final response = await _apiService.getRandomCoctail();
    if (response.drinks.length > 0) {
      result = _mapper.createCocktailFromDto(response.drinks.first);
    }
    return result;
  }

  Future<Iterable<CocktailDefinition>> getCocktailsByType(
      CocktailType type) async {
    var result = <CocktailDefinition>[];
    final response = await _apiService.getCoctailsByType(type.value);
    response.drinks
        .map((e) => CocktailDefinition(
            id: e.idDrink,
            name: e.strDrink,
            drinkThumbUrl: e.strDrinkThumb,
            isFavourite: true))
        .forEach((element) {
      result.add(element);
    });

    return result;
  }

  Future<Ingredient?> getIngredientById(String id) async {
    Ingredient? result;

    final response = await _apiService.getIngredientById(id);
    if (response.ingredients.length > 0) {
      result = _mapper.createIngredientFromDto(response.ingredients.first);
    }

    return result;
  }
}

class CocktailMapper {
  Cocktail createCocktailFromDto(CocktailDto dto) {
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

  /// isn't working properly; it's not correct to use '!'
  /// cocktail parsing could be crashed
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

  Ingredient createIngredientFromDto(IngridientDto response) {
    return Ingredient(
        name: response.strIngredient,
        description: response.strDescription,
        ingredientType: response.strType,
        isAlcoholic: response.strAlcohol == 'true');
  }
}
