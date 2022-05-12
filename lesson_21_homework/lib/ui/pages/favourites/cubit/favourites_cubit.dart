import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : super(const FavouritesState(<String, CocktailDefinition>{}));

  void addToFavourite(CocktailDefinition cocktail) {
    emit(
      state.copyWith(
        favouriteCocktailsMap: {
          ...state.favouriteCocktailsMap,
          cocktail.id: cocktail
        },
      ),
    );
  }

  void removeFromFavourite(String id) {
    emit(
      state.copyWith(
        favouriteCocktailsMap: {...state.favouriteCocktailsMap}..remove(id),
      ),
    );
  }
}
