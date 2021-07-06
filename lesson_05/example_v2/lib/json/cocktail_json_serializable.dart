import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail_json_serializable.g.dart';

// /askdjnasjhndfas.jpg
// https://some.com/askdjnasjhndfas.jpg

String fullImageFromImage(String shortUrl) {
  return 'https://some.com/$shortUrl';
}

@immutable
@JsonSerializable() // аннотация
class Cocktail {
  const Cocktail({
    required this.id,
    this.name,
    this.drinkThumbUrl,
    this.isFavourite,
  });

  final String id;
  final String? name;
  final String? drinkThumbUrl;
  final bool? isFavourite;

  factory Cocktail.fromJson(Map<String, dynamic> json) => _$CocktailFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}
