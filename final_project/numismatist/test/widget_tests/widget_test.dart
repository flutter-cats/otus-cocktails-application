@TestOn('vm')

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/api/dto/catalog_dto.dart';
import 'package:numismatist/api/dto/item_dto.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';
import 'package:numismatist/core/appbuilder.dart';
import 'package:numismatist/core/const.dart';

import 'package:numismatist/main.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/models/currency.dart';
import 'package:numismatist/repository/models/favorite.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/repository/repository.dart';
import 'package:numismatist/state/catalogs_state.dart';
import 'package:numismatist/state/favorites_state.dart';
import 'package:numismatist/state/items_state.dart';
import 'package:provider/provider.dart';
import 'widget_test.mocks.dart';
import '../impls/client_api.dart';

@GenerateMocks(
  [RestClientImpl, Catalog, Item],
  customMocks: [
    MockSpec<CatalogDto>(returnNullOnMissingStub: true),
    MockSpec<ItemDto>(returnNullOnMissingStub: true),
  ],
)
void main() {
  final date = DateTime.now();
  const id = 'id';
  final RestClient restClient = MockRestClientImpl();

  setUpAll(() async {
    final CatalogDto catalogDto = MockCatalogDto();

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

    when(restClient.lastUpdate()).thenAnswer((_) => Future.value(LastUpdateDto(lastUpdate: date.toString())));
    when(catalogDto.id).thenReturn(id);
    when(catalogDto.lastUpdate).thenReturn(date.toString());
    when(restClient.catalogs()).thenAnswer((_) => Future.value([catalogDto]));
    when(restClient.items(id)).thenAnswer((_) => Future.value([MockItemDto(), MockItemDto()]));
  });

  testWidgets('App smoke test', (WidgetTester tester) async {
    final repository = Repository(restClient);
    await tester.pumpWidget(MultiProvider(providers: [
      Provider(create: (_) => CatalogsState(repository)),
      Provider(create: (_) => ItemsState(repository)),
      Provider(create: (_) => FavoritesState(repository)),
    ], child: const MyApp()));

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('НумизматЪ'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Каталог'), findsOneWidget);
    expect(find.text('Поиск'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.sync));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.sync), findsOneWidget);
    expect(find.text('Обновить сейчас'), findsOneWidget);
    expect(find.textContaining('Требуется обновление'), findsOneWidget);
  });

  testWidgets('Sync test', (WidgetTester tester) async {
    final repository = Repository(restClient);
    await tester.pumpWidget(MultiProvider(providers: [
      Provider(create: (_) => CatalogsState(repository)),
      Provider(create: (_) => ItemsState(repository)),
      Provider(create: (_) => FavoritesState(repository)),
    ], child: const MyApp()));

    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byIcon(Icons.sync));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.sync), findsOneWidget);
    expect(find.text('Обновить сейчас'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.sync));
    await tester.pump(const Duration(seconds: 10));

    expect(find.byIcon(Icons.sync), findsNothing);
  });

  testWidgets('Catalogs test', (WidgetTester tester) async {
    final repository = Repository(restClient);
    await tester.pumpWidget(MultiProvider(providers: [
      Provider(create: (_) => CatalogsState(repository)),
      Provider(create: (_) => ItemsState(repository)),
      Provider(create: (_) => FavoritesState(repository)),
    ], child: const MyApp()));

    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byIcon(Icons.sync));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.sync));
    await tester.pump(const Duration(seconds: 10));

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.textContaining('Монет в каталоге'), findsWidgets);
  });
}
