import 'dart:async';
import 'package:cocktail_db_http_using/src/dto/coctail_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' ;

part 'coctail_api_service.g.dart';

@RestApi(baseUrl: "https://the-cocktail-db.p.rapidapi.com/")
abstract class CoctailApiService {

  factory CoctailApiService(Dio dio, {String baseUrl}) = _CoctailApiService;

  @GET("/popular.php")
  Future<CoctailReponseDto> getMeow();
}