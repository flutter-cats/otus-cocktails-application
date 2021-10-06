import 'package:cocktail_db_http_using/src/dto/coctail_response_dto.dart';
import 'package:cocktail_db_http_using/src/repository/coctail_api_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:async';

///TODO: other requests, mapper for models (get from [async_coctail_repository.dart] )
class AppRepository {

  static const API_KEY = 'e5b7f97a78msh3b1ba27c40d8ccdp105034jsn34e2da32d50b';

  late CoctailApiService _apiService;
  Dio dio = Dio();

  AppRepository() {
    dio = Dio();
    dio.options.headers['x-rapidapi-key'] = API_KEY;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      compact: true,
      maxWidth: 90
    ));
    _apiService = CoctailApiService(dio);
  }

  Future<CoctailReponseDto> getCoctails() => _apiService.getMeow();
}