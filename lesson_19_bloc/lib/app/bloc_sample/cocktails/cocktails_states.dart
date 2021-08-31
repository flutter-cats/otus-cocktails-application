
//Пример описания с помощью
// sealed_flutter_bloc

import 'package:lesson_17/app/core/src/model/cocktail_definition.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class CocktailsState extends Union4Impl<CocktailsInitial, CocktailsLoadInProgress, CocktailsLoadSuccess, CocktailsLoadFailure> {
  static final unions = const Quartet<CocktailsInitial, CocktailsLoadInProgress, CocktailsLoadSuccess, CocktailsLoadFailure>();

  CocktailsState._(Union4<CocktailsInitial, CocktailsLoadInProgress, CocktailsLoadSuccess, CocktailsLoadFailure> union)
      : super(union);

  factory CocktailsState.initial() => CocktailsState._(unions.first(CocktailsInitial()));

  factory CocktailsState.loading() =>
      CocktailsState._(unions.second(CocktailsLoadInProgress()));

  factory CocktailsState.success(
      {required Iterable<CocktailDefinition> cocktails}) =>
      CocktailsState._(unions.third(CocktailsLoadSuccess(cocktails: cocktails)));

  factory CocktailsState.failure({required String errorMessage}) =>
      CocktailsState._(unions.fourth(CocktailsLoadFailure(errorMessage: errorMessage)));
}

class CocktailsInitial {}

class CocktailsLoadInProgress {}

class CocktailsLoadSuccess {
  final Iterable<CocktailDefinition> cocktails;

  CocktailsLoadSuccess({required this.cocktails});
}

class CocktailsLoadFailure {
  String errorMessage;

  CocktailsLoadFailure({required this.errorMessage});
}
