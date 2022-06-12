import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/api/dto/catalog_dto.dart';
import 'package:numismatist/api/dto/item_dto.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';

class RestClientImpl implements RestClient {
  @override
  Future<List<CatalogDto>> catalogs() {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemDto>> items(String id) {
    throw UnimplementedError();
  }

  @override
  Future<LastUpdateDto> lastUpdate() {
    throw UnimplementedError();
  }
}
