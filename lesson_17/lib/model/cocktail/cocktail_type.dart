import 'package:lesson_17/model/entity.dart';

///
/// curl https://the-cocktail-db.p.rapidapi.com/list.php\?c\=list
///
class CocktailType implements Entity {
  const CocktailType({
    required this.id,
    required this.name,
    required this.value,
  });

  factory CocktailType.fromJson(Map<String, dynamic> json) {
    return CocktailType(id: json['id'] as String, name: json['name'] as String, value: json['value'] as String);
  }

  @override
  final String id;
  final String value;
  final String name;

  @override
  Map<String, String> toJson() {
    return {
      'id': id,
      'value': value,
      'name': name,
    };
  }
}
