import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lesson_17/model/entity.dart';

part 'cocktail_category.g.dart';

///
/// curl https://the-cocktail-db.p.rapidapi.com/list.php\?c\=list
///
@HiveType(typeId: 2)
@immutable
class CocktailCategory implements Entity {
  const CocktailCategory({
    required this.id,
    required this.name,
    required this.value,
  });

  factory CocktailCategory.fromJson(Map<String, dynamic> json) {
    return CocktailCategory(id: json['id'] as String, name: json['name'] as String, value: json['value'] as String);
  }

  @override
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String value;

  @HiveField(2)
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
