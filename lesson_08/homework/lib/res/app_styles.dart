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
  static const sliverGridTitleStyle =
      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  static const sliverGridIdStyle = TextStyle(fontSize: 10.0);
  static const categoryChipTextStyle = TextStyle(fontSize: 15.0);
  static const gridErrorTextStyle =
      TextStyle(color: AppColors.gridErrorTextColor, fontSize: 18.0);
}
