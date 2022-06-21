import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

extension StringExtension on String {
  T? toEnum<T extends Object>(List<T> list) => list.firstWhereOrNull((d) => describeEnum(d).toLowerCase() == toLowerCase());

  String toPascalCase() => substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}
