import 'package:flutter/cupertino.dart';

@immutable
class Cocktail {
  const Cocktail({
    required this.id,
    required this.name,
    required this.drinkThumbUrl,
    required this.isFavourite,
  });

  final String? id;
  final String? name;
  final String? drinkThumbUrl;
  final bool? isFavourite;
}
