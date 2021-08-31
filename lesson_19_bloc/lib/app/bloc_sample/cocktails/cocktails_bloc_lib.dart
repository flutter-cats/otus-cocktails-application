import 'dart:async';
import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_states.dart';
import 'package:lesson_17/app/bloc_sample/cocktails/cocktails_states.dart';
import 'package:lesson_17/app/core/models.dart';
import 'package:lesson_17/app/repository/cocktail_repository.dart';
import 'cocktails_events.dart';

class CocktailsBlocLib extends Bloc<CocktailsEvent, CocktailsState> {
  // Пример подписки одного блока на другой
  CocktailsBlocLib({
    required this.cocktailRepository,
    required this.categoriesBloc,
  }) : super(CocktailsState.initial()) {
    _categoriesSubscription = this.categoriesBloc.stream.listen((state) {
      if (state is CategoriesLoadSuccess && state.selectedCategory != null) {
        _fetchCocktails(state.selectedCategory!);
        add(CocktailsFetched(state.selectedCategory!));
      }
    });
  }

  late StreamSubscription _categoriesSubscription;

  final CocktailRepository cocktailRepository;

  final CategoriesBloc categoriesBloc;

  @override
  Future<void> close() {
    _categoriesSubscription.cancel();
    return super.close();
  }

  @override
  Stream<CocktailsState> mapEventToState(CocktailsEvent event) async* {
    if (event is CocktailsFetched) {
      yield* _fetchCocktails(event.category);
    }
  }

  Stream<CocktailsState> _fetchCocktails(CocktailCategory category) async* {
    try {
      yield CocktailsState.loading();
      final cocktails =
          await cocktailRepository.fetchCocktailsByCocktailCategory(category);
      yield CocktailsState.success(cocktails: UnmodifiableListView(cocktails));
    } catch (e) {
      print(e);
      yield CocktailsState.failure(errorMessage: e.toString());
    }
  }
}
