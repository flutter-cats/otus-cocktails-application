part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  const FavouritesState({required this.cocktailsList});

  final List<CocktailDefinition> cocktailsList;

  FavouritesState copyWith({List<CocktailDefinition>? cocktailsList}) {
    return FavouritesState(cocktailsList: cocktailsList ?? this.cocktailsList);
  }

  List<CocktailDefinition> get list => cocktailsList;

  @override
  List<Object?> get props => [cocktailsList];
}
