part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  const FavouritesState({required this.cocktailsList});

  final Map<String, CocktailDefinition> cocktailsList;

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is FavouritesState &&
  //         runtimeType == other.runtimeType &&
  //         cocktailsList == other.cocktailsList;
  //
  // @override
  // int get hashCode => cocktailsList.hashCode;

  FavouritesState copyWith({Map<String, CocktailDefinition>? cocktailsList}) {
    return FavouritesState(cocktailsList: cocktailsList ?? this.cocktailsList);
  }

  @override
  List<Object?> get props => [cocktailsList];
}
