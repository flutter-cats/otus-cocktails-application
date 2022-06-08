import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'lastupdate_dto.g.dart';

@JsonSerializable()
class LastUpdateDto {
  @JsonKey(name: "lastUpdate")
  final String lastUpdate;
  LastUpdateDto({
    required this.lastUpdate,
  });

  Map<String, dynamic> toJson() => _$LastUpdateDtoToJson(this);
  factory LastUpdateDto.fromJson(Map<String, dynamic> json) => _$LastUpdateDtoFromJson(json);
}
