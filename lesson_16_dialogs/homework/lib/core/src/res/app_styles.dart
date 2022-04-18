import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const cocktailNameTextStyle = TextStyle(
    fontSize: 20.0,
  );
  static const cocktailIdTextStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.idColor,
  );
  static const descriptionNameTextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColors.descriptionName,
  );
  static const ingredientsTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.ingredients,
  );
  static const ingredientNameTextStyle = TextStyle(
    decoration: TextDecoration.underline,
  );
}
