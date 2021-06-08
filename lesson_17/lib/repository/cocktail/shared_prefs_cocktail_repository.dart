import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/repository/entity/shared_prefs_repository.dart';

class SharedPrefsCocktailRepository extends SharedPrefsRepository<Cocktail> {
  @override
  Cocktail entityFabric(Map<String, dynamic> json) => Cocktail.fromJson(json);
}
