import 'dart:io';

import 'package:dio/dio.dart';
import 'package:numismatist/api/dto/catalog_dto.dart';
import 'package:numismatist/api/dto/item_dto.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';
import 'package:numismatist/core/const.dart';
import 'package:retrofit/retrofit.dart';

part 'client_api.g.dart';

class RestClientBuilder {
  static RestClient setup() {
    final dio = Dio(); // создаём инстанс dio и настраиваем его
    dio.interceptors.add(LogInterceptor(responseBody: true));

    dio.options.headers["User-Agent"] = "Numismatist flutter app"; // config your dio headers globally
    return RestClient(dio, baseUrl: Const.baseUrl);
  }
}

@RestApi(baseUrl: Const.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("Catalog/lastupdate")
  Future<LastUpdateDto> lastUpdate();

  @GET("Catalog/catalogs")
  Future<List<CatalogDto>> catalogs();

  @GET("Catalog/catalog/{id}")
  Future<List<ItemDto>> syncTickets(@Path("id") String id);
}
