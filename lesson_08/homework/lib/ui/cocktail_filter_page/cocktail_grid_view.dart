import 'package:flutter/material.dart';

import '../../core/models.dart';
import '../../res/app_dimens.dart';
import 'grid_view_item.dart';

class CocktailGridView extends StatelessWidget {
  const CocktailGridView({Key? key, this.snapshot}) : super(key: key);

  final snapshot;

  @override
  Widget build(BuildContext context) {
    final cocktails = snapshot.data as Iterable<CocktailDefinition>;

    return SliverPadding(
      padding: AppDimensions.sliverPaddingSize,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: AppDimensions.sliverGridMaxCrossAxisExtent,
          mainAxisSpacing: AppDimensions.sliverGridMinAxisSpacing,
          crossAxisSpacing: AppDimensions.sliverGridMinCrossAxisSpacing,
          childAspectRatio: AppDimensions.sliverGridChildAspectRatio,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final cocktail = cocktails.elementAt(index);
            return GridViewItem(
              cocktail: cocktail,
            );
          },
          childCount: cocktails.length,
        ),
      ),
    );
  }
}
