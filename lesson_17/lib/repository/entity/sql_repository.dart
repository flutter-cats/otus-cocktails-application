import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lesson_17/benchmark.dart';
import 'package:lesson_17/main.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqlRepository<T extends Entity> implements EntityRepository<T> {
  @protected
  late Database db;

  @protected
  int get version;

  @protected
  Future<void> onCreate(Database db, int version);

  @override
  Future<void> init() async {
    bench.start('Init $runtimeType repo');
    final Directory dir = await getApplicationDocumentsDirectory();
    db = await openDatabase('${dir.path}/${T.hashCode}.db', onCreate: onCreate, version: version);
    bench.end('Init $runtimeType repo');
  }

  @override
  Future<int> saveIndex(int index) async {
    bench.start('SaveIndex $runtimeType repo');
    // TODO(alphamikle): Delete this return and continue there
    bench.end('SaveIndex $runtimeType repo');
    return index;
  }

  @override
  Future<int> readIndex() async {
    bench.start('ReadIndex $runtimeType repo');
    // TODO(alphamikle): Delete this return and continue there
    bench.end('ReadIndex $runtimeType repo');
    return INITIAL_INDEX;
  }
}
