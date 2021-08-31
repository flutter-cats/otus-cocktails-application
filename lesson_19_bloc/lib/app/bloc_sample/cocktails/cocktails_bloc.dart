import 'dart:async';
import 'dart:collection';

import 'package:lesson_17/app/bloc_sample/base_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_states.dart';
import 'package:lesson_17/app/core/models.dart';
import 'package:lesson_17/app/repository/cocktail_repository.dart';

import 'cocktails_events.dart';
import 'cocktails_states.dart';

class CocktailsBloc extends BaseBloc<CocktailsEvent, CocktailsState> {
  // Пример подписки одного блока на другой
  CocktailsBloc(this.cocktailRepository, this.categoriesBlocLib)
      : super(CocktailsState.initial()) {
    _categoriesSubscription = this.categoriesBlocLib.stream.listen((state) {
      if (state is CategoriesLoadSuccess && state.selectedCategory != null) {
        _fetchCocktails(state.selectedCategory!);
      }
    });
  }

  late StreamSubscription _categoriesSubscription;

  final CocktailRepository cocktailRepository;

  final CategoriesBloc categoriesBlocLib;

  @override
  void close() {
    _categoriesSubscription.cancel();
    super.close();
  }

  @override
  void onEvent(CocktailsEvent event) {
    if (event is CocktailsFetched) {
      _fetchCocktails(event.category);
    }
  }

  //TODO Задание: найти здесь место, которое может вызывать ошибку.
  Future<void> _fetchCocktails(CocktailCategory category) async {
    try {
      updateState(CocktailsState.loading());
      final cocktails =
          await cocktailRepository.fetchCocktailsByCocktailCategory(category);
      updateState(
          CocktailsState.success(cocktails: UnmodifiableListView(cocktails)));
    } catch (e) {
      print(e);
      updateState(CocktailsState.failure(errorMessage:e.toString()));
    }
  }
}
