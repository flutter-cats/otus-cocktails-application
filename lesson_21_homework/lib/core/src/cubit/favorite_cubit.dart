import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/core/src/cubit/favorite_state.dart';
import 'package:lesson_21_animations_homework/core/src/repository/favorite_cocktails_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(favoriteCocktailsRepository)
      : super(FavoriteState(repository: FavoriteCocktailsRepository()));

  void addToFavorite(Cocktail cocktail) {
    state.repository.addToFavorite(cocktail);
    emit(FavoriteState(repository: state.repository));
  }

  void addToFavoriteByDefinition(CocktailDefinition cocktailDefinition) {
    state.repository.addToFavoriteByDefinition(cocktailDefinition);
    emit(FavoriteState(repository: state.repository));
  }

  void removeFromFavorite(Cocktail cocktail) {
    state.repository.removeFromFavorite(cocktail);
    emit(FavoriteState(repository: state.repository));
  }

  void removeFromFavoriteByDefinition(CocktailDefinition cocktailDefinition) {
    state.repository.removeFromFavoriteByDefinition(cocktailDefinition);
    emit(FavoriteState(repository: state.repository));
  }
}
