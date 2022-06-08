import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/api/client_api.dart';
import 'package:numismatist/api/dto/lastupdate_dto.dart';
import 'package:numismatist/core/const.dart';

class Storage with ChangeNotifier {
  final _client = RestClientBuilder.setup();
  final _settings = Hive.box(Const.settingsBox);

  bool _needUpdate = false;
  bool get needUpdate => _needUpdate;

  DateTime get lastSync => DateTime.tryParse(_settings.get(Const.lastSyncKey) ?? "") ?? DateTime.now().add(const Duration(days: -60));
  set lastSync(DateTime value) => _settings.put(Const.lastSyncKey, value);

  void checkNeedSync() {
    lastCatalogsUpdate().then((value) {
      _needUpdate = value.isAfter(lastSync);
      notifyListeners();
    });
  }

  Future<DateTime> lastCatalogsUpdate() async => DateTime.tryParse((await _client.lastUpdate().catchError((e) => LastUpdateDto(lastUpdate: ""))).lastUpdate) ?? lastSync;
}
