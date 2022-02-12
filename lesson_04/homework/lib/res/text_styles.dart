import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle commonTextStyle({bool underscope = false}) {
  if (!underscope)
    return TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
  else
    return TextStyle(
      color: Colors.white,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
}

TextStyle forIDTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 13,
);

TextStyle typesTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);

TextStyle ingredientsLabel = TextStyle(
  color: Color(0xFFB1AFC6),
  fontSize: 18,
);

TextStyle forInstructionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
);
