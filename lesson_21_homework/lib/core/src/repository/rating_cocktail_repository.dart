import 'package:hive/hive.dart';

abstract class RatingCocktailRepository {
  void initRatingCocktailRepository();

  int getCocktailRatingById(int id);

  void setCocktailRating(int id, int rating);

  Map<int, int> getCocktailsRatingMap();

  void clearRating();
}

class RatingCocktailRepositoryImpl extends RatingCocktailRepository {
  static const ratingBoxName = 'ratingCocktails';

  late Box<int> cocktailsRatingBox;

  @override
  Future<Map<int, int>> initRatingCocktailRepository() async {
    cocktailsRatingBox = await Hive.openBox(ratingBoxName);
    final cocktailsRatingMap = getCocktailsRatingMap();
    return cocktailsRatingMap;
  }

  @override
  Map<int, int> getCocktailsRatingMap() {
    final cocktailsRatingMap = Map<int, int>.from(cocktailsRatingBox.toMap());
    return cocktailsRatingMap;
  }

  @override
  int getCocktailRatingById(int id) {
    if (cocktailsRatingBox.containsKey(id)) {
      final int cocktailRating = cocktailsRatingBox.get(id)!;
      return cocktailRating;
    }
    return 0;
  }

  @override
  Map<int, int> setCocktailRating(int id, int rating) {
    cocktailsRatingBox.put(id, rating);
    final ratingCocktailsMap = getCocktailsRatingMap();
    return ratingCocktailsMap;
  }

  @override
  void clearRating() {
    cocktailsRatingBox.clear();
  }
}
