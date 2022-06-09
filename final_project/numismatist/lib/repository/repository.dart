import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';
import 'package:numismatist/core/const.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/models/item.dart';

class Repository {
  final _client = RestClientBuilder.setup();
  final _settings = Hive.box(Const.settingsBox);
  final _catalogs = Hive.box<Catalog>(Const.catalogsBox);
  final _items = Hive.box<Item>(Const.itemsBox);

  DateTime get lastSync => DateTime.tryParse(_settings.get(Const.lastSyncKey)?.toString() ?? "") ?? DateTime.now();
  set lastSync(DateTime value) => _settings.put(Const.lastSyncKey, value);

  Future<bool> checkUpdate() async => (await _lastCatalogsUpdate()).isAfter(lastSync);

  Future<int> getUpdatedCount() async => (await _updatedCatalogs()).length;

  // синхронизация каталогов с монетами
  Future<void> sync() async {
    final catalogs = await _updatedCatalogs();
    if (catalogs.isNotEmpty) {
      for (var catalog in catalogs) {
        await _catalogs.put(catalog.id, catalog);
      }
    } else {
      catalogs.clear();
      catalogs.addAll(_catalogs.values);
    }
    // использовать изоляты для получения каталогов монет - они могут быть тяжелые
    final items = await compute(_syncCatalogs, catalogs.map((e) => e.id).toList());
    for (var item in items) {
      await _items.put(item.id, item);
    }
    lastSync = catalogs.map((e) => e.lastUpdate).reduce((value1, value2) => value1.isAfter(value2) ? value1 : value2);
  }

  Future<DateTime> _lastCatalogsUpdate() async => DateTime.tryParse((await _client.lastUpdate().catchError((e) => LastUpdateDto(lastUpdate: ""))).lastUpdate) ?? lastSync;

  Future<List<Catalog>> _updatedCatalogs() async {
    final serverCatalogs = (await _client.catalogs()).map(Catalog.createFromDto);
    final updatedCatalogs = List<Catalog>.empty(growable: true);

    for (var catalog in serverCatalogs) {
      if (!_catalogs.containsKey(catalog.id)) {
        updatedCatalogs.add(catalog);
      } else if (_catalogs.get(catalog.id)!.lastUpdate.isBefore(catalog.lastUpdate)) {
        updatedCatalogs.add(catalog);
      }
    }
    return updatedCatalogs;
  }

  static Future<List<Item>> _syncCatalogs(List<String> ids) async {
    final client = RestClientBuilder.setup();
    final items = List<Item>.empty(growable: true);
    for (var id in ids) {
      final coins = (await client.items(id)).map(Item.createFromDto).toList();
      items.addAll(coins);
    }
    return items;
  }
}
