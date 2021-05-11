class CocktailDefinition {
  CocktailDefinition({
    required this.id,
    required this.name,
    required this.drinkThumbUrl,
    required this.isFavourite,
  });

  final String id;
  final String name;
  final String drinkThumbUrl;
  final bool isFavourite;
}
