import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:lesson_21_animations_homework/core/models.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit()
      : super(FavoritesState(Map<String, CocktailDefinitionDto>()));

  @override
  FavoritesState fromJson(Map<String, dynamic> json) {
    return FavoritesState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(FavoritesState state) {
    return state.toMap();
  }

  void addToFavorites(CocktailDefinitionDto cocktailDefinition) {
    emit(
      FavoritesState(
        {...state.favoritesMap, cocktailDefinition.idDrink: cocktailDefinition},
      ),
    );
  }

  void removeFromFavorites(String id) {
    emit(
      FavoritesState(
        ({...state.favoritesMap}..remove(id)),
      ),
    );
  }
}
