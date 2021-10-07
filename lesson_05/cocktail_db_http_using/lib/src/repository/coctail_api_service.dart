import 'dart:async';
import 'package:cocktail_app_models/models.dart';
import 'package:cocktail_db_http_using/src/dto/coctail_response_dto.dart';
import 'package:cocktail_db_http_using/src/dto/ingredient_reponse_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' ;

part 'coctail_api_service.g.dart';

@RestApi(baseUrl: "https://the-cocktail-db.p.rapidapi.com/")
abstract class CoctailApiService {

  factory CoctailApiService(Dio dio, {String baseUrl}) = _CoctailApiService;

  @GET("/popular.php")
  Future<CoctailReponseDto> getPopularCoctails();

  @GET("/random.php")
  Future<CoctailReponseDto> getRandomCoctail();

  @GET("/lookup.php")
  Future<CoctailReponseDto> getCoctailDetails(@Query('i') String id);

  @GET("/filter.php")
  Future<CoctailReponseDto> getCoctailsByType(@Query("a") String type);

  @GET("lookup.php")
  Future<IngredientResponseDto> getIngredientById(@Query("iid") String id);
}