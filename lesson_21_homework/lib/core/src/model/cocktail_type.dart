import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cocktail_type.g.dart';
///
/// curl https://the-cocktail-db.p.rapidapi.com/list.php\?a\=list
@HiveType(typeId: 5)
class CocktailType {
 
  static const CocktailType alcoholic =
      CocktailType._('alcoholic', 'Alcoholic');
    
  static const CocktailType nonAlcoholic =
      CocktailType._('nonAlcoholic', 'Non alcoholic');
   
  static const CocktailType optionalAlcohol =
      CocktailType._('optionalAlcohol', 'Optional alcohol');

 
  static const Iterable<CocktailType> values = [
    alcoholic,
    nonAlcoholic,
    optionalAlcohol
  ];
  @HiveField(4)
  final String value;
  @HiveField(5)
  final String name;

  const CocktailType._(this.name, this.value);
  const CocktailType(this.name, this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailType &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  String toString() => 'CocktailType{value: $value, name: $name}';

  ///
  /// Show toString() method using in debug session
  ///

  static CocktailType? parse(String raw) => values.firstWhereOrNull(
      (element) => element.value.toLowerCase() == raw.toLowerCase());
}
