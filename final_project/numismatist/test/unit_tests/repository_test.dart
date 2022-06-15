import 'package:flutter_test/flutter_test.dart';
import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/api/dto/catalog_dto.dart';
import 'package:numismatist/api/dto/item_dto.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';
import 'package:numismatist/core/const.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../impls/client_api.dart';
import 'repository_test.mocks.dart';

@TestOn('vm')
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/favorite.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/repository/repository.dart';

@GenerateMocks(
  [RestClientImpl, Catalog, Item],
  customMocks: [
    MockSpec<CatalogDto>(returnNullOnMissingStub: true),
    MockSpec<ItemDto>(returnNullOnMissingStub: true),
  ],
)
void main() {
  final RestClient restClient = MockRestClientImpl();

  late Repository repository;
  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyAdapter());
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(FavoriteAdapter());
    Hive.registerAdapter(ItemAdapter());
    if (await Hive.boxExists(Const.catalogsBox)) await Hive.deleteBoxFromDisk(Const.catalogsBox);
    if (await Hive.boxExists(Const.itemsBox)) await Hive.deleteBoxFromDisk(Const.itemsBox);
    if (await Hive.boxExists(Const.favoriteBox)) await Hive.deleteBoxFromDisk(Const.favoriteBox);
    if (await Hive.boxExists(Const.settingsBox)) await Hive.deleteBoxFromDisk(Const.settingsBox);
    await Hive.openBox<Catalog>(Const.catalogsBox);
    await Hive.openBox<Item>(Const.itemsBox);
    await Hive.openBox<Favorite>(Const.favoriteBox);
    await Hive.openBox(Const.settingsBox);
    repository = Repository(restClient);
  });

  tearDownAll(() async {
    if (await Hive.boxExists(Const.catalogsBox)) await Hive.deleteBoxFromDisk(Const.catalogsBox);
    if (await Hive.boxExists(Const.itemsBox)) await Hive.deleteBoxFromDisk(Const.itemsBox);
    if (await Hive.boxExists(Const.favoriteBox)) await Hive.deleteBoxFromDisk(Const.favoriteBox);
    if (await Hive.boxExists(Const.settingsBox)) await Hive.deleteBoxFromDisk(Const.settingsBox);
  });

  group('Empty repository should', () {
    setUp(() {
      when(restClient.lastUpdate()).thenAnswer((_) => Future.value(LastUpdateDto(lastUpdate: DateTime.now().toString())));
    });
    test(' be with empty catalogs in initial state', () {
      expect(repository.getCatalogs().isEmpty, isTrue);
    });
    test(' be with empty items in initial state', () async {
      expect((await repository.getItems('')).isEmpty, isTrue);
    });
    test(' be with empty favorites in initial state', () async {
      expect(repository.getFavorites().isEmpty, isTrue);
    });
    test(' be find nothing in initial state', () async {
      expect((await repository.findItems('')).isEmpty, isTrue);
    });

    test(' need updates', () async {
      expect(await repository.checkUpdate(), isTrue);
    });
  });

  group('Repository before sync should', () {
    final date = DateTime.now();
    const id = 'id';

    setUp(() {
      final CatalogDto catalogDto = MockCatalogDto();
      when(restClient.lastUpdate()).thenAnswer((_) => Future.value(LastUpdateDto(lastUpdate: date.toString())));
      when(catalogDto.id).thenReturn(id);
      when(catalogDto.lastUpdate).thenReturn(date.toString());
      when(restClient.catalogs()).thenAnswer((_) => Future.value([catalogDto]));
      when(restClient.items(id)).thenAnswer((_) => Future.value([MockItemDto(), MockItemDto()]));
    });
    test(' has updates in initial state', () async {
      expect(await repository.checkUpdate(), isTrue);
    });
    test(' be catalog to update', () async {
      expect((await repository.getUpdatedCount()), 1);
    });
    test(' be with empty catalogs in initial state', () {
      expect(repository.getCatalogs().isEmpty, isTrue);
    });
    test(' be with empty items in initial state', () async {
      expect((await repository.getItems(id)).isEmpty, isTrue);
    });
    test(' be with empty favorites in initial state', () async {
      expect(repository.getFavorites().isEmpty, isTrue);
    });
    test(' be find nothing in initial state', () async {
      expect((await repository.findItems(id)).isEmpty, isTrue);
    });
  });

  group('Repository after sync should', () {
    final date = DateTime.now();
    const id = 'id';
    const name = 'name';
    final CatalogDto catalogDto = MockCatalogDto();
    final ItemDto itemDto = MockItemDto();
    setUp(() async {
      when(restClient.lastUpdate()).thenAnswer((_) => Future.value(LastUpdateDto(lastUpdate: date.toString())));
      when(catalogDto.id).thenReturn(id);
      when(catalogDto.lastUpdate).thenReturn(date.toString());
      when(itemDto.lastUpdate).thenReturn(date.toString());
      when(itemDto.name).thenReturn(name);
      when(restClient.catalogs()).thenAnswer((_) => Future.value([catalogDto]));
      when(restClient.items(id)).thenAnswer((_) => Future.value([itemDto]));
      await repository.sync();
    });
    test(' has no updates in initial state', () async {
      expect(await repository.checkUpdate(), false);
    });
    test(' be none catalog to update', () async {
      expect((await repository.getUpdatedCount()), 0);
    });
    test(' be with some catalogs', () {
      expect(repository.getCatalogs().isNotEmpty, isTrue);
    });
    test(' be with some items', () async {
      expect((await repository.getItems(id)).isEmpty, isTrue);
    });
    test(' be find some in initial state', () async {
      expect((await repository.findItems(name)).isEmpty, isTrue);
    });
  });
}
