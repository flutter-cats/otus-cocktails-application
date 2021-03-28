import 'package:json_annotation/json_annotation.dart';

///
/// это будет сгенерированный файл
///
part 'some_model.g.dart';

@JsonSerializable()
class SomeModel {
  @JsonKey(name: 'identity', required: true)
  final String id;

  @JsonKey(name: 'name', required: true)
  final String name;

  SomeModel(this.id, this.name);

  factory SomeModel.fromJson(Map<String, dynamic> json) =>
      _$SomeModelFromJson(json);
}
