import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_events.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_states.dart';
import 'package:lesson_17/app/core/models.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial());

  @override
  void onEvent(CategoriesEvent event) {
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CategoriesEvent, CategoriesState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<Transition<CategoriesEvent, CategoriesState>> transformTransitions(
      Stream<Transition<CategoriesEvent, CategoriesState>> transitions) {
    return super.transformTransitions(transitions);
  }

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is CategoriesFetched) {
      // yield CategoriesLoadInProgress();
      // yield CategoriesLoadFailure('errorMessage');
      yield CategoriesLoadSuccess(
          categories: UnmodifiableListView(CocktailCategory.values),
          selectedCategory: CocktailCategory.values.first);
    } else if (event is CategoriesCategorySelected &&
        state is CategoriesLoadSuccess) {
      final dateState = state as CategoriesLoadSuccess;
      yield dateState.copyWith(selectedCategory: event.category);
    }
  }
}
