import 'package:freezed_annotation/freezed_annotation.dart';

///
/// это будет сгенерированные файлы
///
part 'cocktail.freezed.dart';
part 'cocktail.g.dart';

@freezed
abstract class Cocktail with _$Cocktail {
  factory Cocktail({
    String? id,
    String? drink,
    String? category,
    String? alcoholic,
    @JsonKey(name: 'strGlass') String? glass,
  }) = _Cocktail;

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}
