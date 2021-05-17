// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lesson_18/provider/injectable_deps.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IThirdClass>(() => _i3.IThirdClass());
  gh.factory<_i3.ISecondClass>(() => _i3.ISecondClass(get<_i3.IThirdClass>()));
  gh.factory<_i3.IFirstClass>(
      () => _i3.IFirstClass(secondClass: get<_i3.ISecondClass>()));
  return get;
}
