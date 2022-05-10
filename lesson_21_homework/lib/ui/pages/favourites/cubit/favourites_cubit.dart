import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(const FavouritesState(cocktailsList: []));

  void addToFavourite(CocktailDefinition cocktail) {
    emit(
      state.copyWith(
        cocktailsList: List.of(state.list)..add(cocktail),
      ),
    );
    print('add performed ____________');
  }

  void removeFromFavourite(CocktailDefinition cocktail) {
    emit(
      state.copyWith(
        cocktailsList: List.of(state.list)..remove(cocktail),
      ),
    );
    print('remove performed ____________');
  }

  void removeFromFavouriteByIndex(int index) {
    emit(state.copyWith(cocktailsList: List.of(state.list)..removeAt(index)));
    print('remove performed ____________');
  }
}
