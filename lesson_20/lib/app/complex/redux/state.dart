import 'package:freezed_annotation/freezed_annotation.dart';

import 'categories/state.dart';
import 'cocktails/state.dart';
import 'favorites/state.dart';

part 'state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  static const initState = AppState(
    categoriesState: CategoriesState.initState,
    favoritesState: FavoritesState.initState,
    cocktailsState: CocktailsState.initState,
  );

  const factory AppState({
    required CategoriesState categoriesState,
    required FavoritesState favoritesState,
    required CocktailsState cocktailsState,
  }) = _AppState;
}
