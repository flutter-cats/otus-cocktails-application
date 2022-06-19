import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CocktailDefinition extends Equatable {
  final String? id;
  final String? name;
  final String? drinkThumbUrl;
  final bool? isFavourite;

  CocktailDefinition({
    @required this.id,
    @required this.name,
    @required this.drinkThumbUrl,
    @required this.isFavourite,
  });

  @override
  List<Object?> get props => [id, name, drinkThumbUrl, isFavourite];
}
