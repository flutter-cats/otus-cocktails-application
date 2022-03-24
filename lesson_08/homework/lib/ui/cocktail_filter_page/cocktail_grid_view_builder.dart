import 'cocktail_grid_view.dart';
import 'grid_error.dart';
import 'shaker_progress.dart';
import 'package:flutter/material.dart';

import '../../cocktail_filter_wrapper.dart';
import '../../core/models.dart';

class CocktailGridViewBuilder extends StatelessWidget {
  const CocktailGridViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AsyncCocktailRepository().fetchCocktailsByCocktailCategory(
        CocktailCategory.values.elementAt(
            StateInheritedWidget.of(context).selectedCocktailCategory),
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShakerProgress();
        }
        if (snapshot.hasError) {
          return GridError(
            snapshot: snapshot,
          );
        }
        if (snapshot.hasData) {
          return CocktailGridView(
            snapshot: snapshot,
          );
        }
        return const ShakerProgress();
      },
    );
  }
}
