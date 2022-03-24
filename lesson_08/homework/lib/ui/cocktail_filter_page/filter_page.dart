import '../../cocktail_filter_wrapper.dart';
import '../../res/app_colors.dart';
import 'package:flutter/material.dart';
import 'cocktail_filter_sliver.dart';

class CocktailsFilterScreen extends StatelessWidget {
  const CocktailsFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CocktailFilterWrapper(
      selectedCocktailCategory: 0,
      child: Container(
        color: AppColors.background,
        child: const SafeArea(
          child: CocktailFilterCustomScrollView(),
        ),
      ),
    );
  }
}
