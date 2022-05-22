import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

import '../../../../core/src/repository/favourite_cocktail_repository.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._favouriteCocktailRepositoryImpl)
      : super(const FavouritesState());

  final FavouriteCocktailRepositoryImpl _favouriteCocktailRepositoryImpl;

  void initFavouriteCocktailCubit() async {
    emit(state.copyWith(status: FavouritesStatus.loading));
    try {
      final newFavouriteCocktails = await _favouriteCocktailRepositoryImpl
          .initFavouriteCocktailRepository();
      if (newFavouriteCocktails.isEmpty) {
        emit(state.copyWith(
          status: FavouritesStatus.empty,
          favouriteCocktailsMap: newFavouriteCocktails,
        ));
      } else {
        emit(state.copyWith(
          status: FavouritesStatus.success,
          favouriteCocktailsMap: newFavouriteCocktails,
        ));
      }
    } on Exception catch (exception) {
      emit(
        state.copyWith(
          status: FavouritesStatus.failure,
          exception: exception,
        ),
      );
    }
  }

  bool isCocktailFavorite(CocktailDefinition cocktail) {
    return _favouriteCocktailRepositoryImpl.isCocktailFavourite(cocktail);
  }

  void toggleFavourite(CocktailDefinition cocktail) {
    late Map<String, CocktailDefinition> newFavouriteCocktails;

    final bool isCocktailFavourite =
        _favouriteCocktailRepositoryImpl.isCocktailFavourite(cocktail);

    if (isCocktailFavourite) {
      newFavouriteCocktails =
          _favouriteCocktailRepositoryImpl.removeFavouriteCocktail(cocktail);
    } else {
      newFavouriteCocktails =
          _favouriteCocktailRepositoryImpl.addFavouriteCocktail(cocktail);
    }
    if (newFavouriteCocktails.isEmpty) {
      emit(state.copyWith(
        status: FavouritesStatus.empty,
        favouriteCocktailsMap: newFavouriteCocktails,
      ));
    } else {
      emit(state.copyWith(
        status: FavouritesStatus.success,
        favouriteCocktailsMap: newFavouriteCocktails,
      ));
    }
  }

  void clearFavourites() {
    _favouriteCocktailRepositoryImpl.clearFavourites();
    emit(state
        .copyWith(favouriteCocktailsMap: {}, status: FavouritesStatus.success));
  }
}
