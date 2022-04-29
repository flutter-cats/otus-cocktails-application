part of 'favorites_cubit.dart';

class FavoritesState {
  FavoritesState(this.favoritesMap);

  final Map<String, CocktailDefinitionDto> favoritesMap;

  bool isFavorites(String id) {
    return favoritesMap.containsKey(id) == true;
  }

  factory FavoritesState.fromMap(Map<String, dynamic> map) {
    return FavoritesState(
      Map<String, CocktailDefinitionDto>.from(
        ((map['favoritesMap'] as Map)).map(
          (key, value) => MapEntry(
            key,
            CocktailDefinitionDto.fromJson(value),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'favoritesMap': this
          .favoritesMap
          .map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
