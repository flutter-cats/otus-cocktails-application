import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(const FavouritesState(favouriteCocktailsMap: {}));

  bool isFavorite(String id) {
    return state.favouriteCocktailsMap.containsKey(id);
  }

  void addToFavourite(CocktailDefinition cocktail) {
    emit(
      state.copyWith(
        favouriteCocktailsMap: {
          ...state.favouriteCocktailsMap,
          cocktail.id: cocktail
        },
      ),
    );
    print('add performed ____________');
  }

  void removeFromFavourite(CocktailDefinition cocktail) {
    emit(
      state.copyWith(
        favouriteCocktailsMap: {...state.favouriteCocktailsMap}
          ..remove(cocktail.id),
      ),
    );
    print('remove performed ____________');
  }
}
