import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/repository/entity/file_repository.dart';

class FileCocktailRepository extends FileRepository<Cocktail> {
  @override
  Cocktail entityFabric(Map<String, dynamic> json) => Cocktail.fromJson(json);
}
