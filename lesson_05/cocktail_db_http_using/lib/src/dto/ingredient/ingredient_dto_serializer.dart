library serializer;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cocktail_db_http_using/src/dto/ingredient/ingredient_dto.dart';

part 'ingredient_dto_serializer.g.dart';

@SerializersFor(const [
  IngredientDto,
])

// By default, `built_value` serialization uses lists and is not compatible
// with other JSON formats. If you'd like to serialize data using a map-based
// JSON approach (which is what you'll find in the json_strings.dart file in
// this project), you can add the StandardJsonPlugin as you see here.
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
