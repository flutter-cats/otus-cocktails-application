import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle commonTextStyle({bool underscope = false}) {
  return TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
}

TextStyle forIDTextStyle() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 13,
  );
}

TextStyle typesTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}

TextStyle ingredientsLabel() {
  return TextStyle(
    color: Color(0xFFB1AFC6),
    fontSize: 18,
  );
}
