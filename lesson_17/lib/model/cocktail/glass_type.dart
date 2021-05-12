import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lesson_17/model/entity.dart';

part 'glass_type.g.dart';

///
/// curl https://the-cocktail-db.p.rapidapi.com/list.php\?c\=list
///
@immutable
@HiveType(typeId: 4)
class GlassType implements Entity {
  const GlassType({
    required this.id,
    required this.name,
    required this.value,
  });

  factory GlassType.fromJson(Map<String, dynamic> json) {
    return GlassType(id: json['id'] as String, name: json['name'] as String, value: json['value'] as String);
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
