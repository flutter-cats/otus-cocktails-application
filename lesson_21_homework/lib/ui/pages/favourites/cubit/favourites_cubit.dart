import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(const FavouritesState(cocktailsList: {}));

  final Map<String, CocktailDefinition> _favouriteItems = {};

  Map<String, CocktailDefinition> get items => _favouriteItems;

  void addToFavourite(String id, CocktailDefinition cocktail) {
    _favouriteItems[id] = cocktail;
    _favouriteItems.forEach((key, value) {
      print('$key, ${value.name}');
    });
    print('add performed ____________');
    // emit(state.copyWith(cocktailsList: {..._favouriteItems, '$id': cocktail}));
    emit(FavouritesState(cocktailsList: {..._favouriteItems, id: cocktail}));
    //emit(state.copyWith(cocktailsList: _favouriteItems));
    // emit(FavouritesState(cocktailsList: _favouriteItems));
  }

  void removeFromFavourite(String id) {
    _favouriteItems.remove(id);

    _favouriteItems.forEach((key, value) {
      print('$key, ${value.name}');
    });
    print('remove performed ____________');
    //emit(state.copyWith(cocktailsList: _favouriteItems));
    emit(FavouritesState(cocktailsList: _favouriteItems));
  }
}
