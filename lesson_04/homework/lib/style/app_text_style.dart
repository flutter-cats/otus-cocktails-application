import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static const primaryTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.primaryTitle,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static const secondaryTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.secondaryTitle,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const primaryText = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const secondaryText = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.secondaryText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const hintText = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.hintText,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  static const errorText = TextStyle(
    fontFamily: 'SF Pro Text',
    color: AppColors.errorText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
}
