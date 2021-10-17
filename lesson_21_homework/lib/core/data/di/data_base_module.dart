import 'package:koin/koin.dart';

import '../data_base_interface.dart';

class DataBaseModule {
  final IDataBase dataBase;

  DataBaseModule(this.dataBase);
}

final dbModule = Module()
  ..single((s) => DataBaseModule(s.get()))
  ..single((s) => DataBaseProvider().provideDataBase());
