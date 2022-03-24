import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import 'cocktail_category_list.dart';
import 'cocktail_grid_view_builder.dart';
import 'cocktail_search_field.dart';

class CocktailFilterCustomScrollView extends StatelessWidget {
  const CocktailFilterCustomScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: AppDimensions.sliverAppBarExpandedHeight,
          floating: true,
          backgroundColor: AppColors.background,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                const CocktailSearchField(),
                const CocktailCategoryList(),
              ],
            ),
          ),
        ),
        const CocktailGridViewBuilder()
      ],
    );
  }
}
