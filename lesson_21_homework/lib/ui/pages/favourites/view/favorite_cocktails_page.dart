import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/widgets/favourites_empty.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/widgets/favourites_error.dart';

import '../../circular_progress_custom.dart';
import '../cubit/favourites_cubit.dart';
import '../widgets/favourites_grid_view.dart';

class FavouriteCocktailsPage extends StatelessWidget {
  const FavouriteCocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FavouriteCocktailsView();
  }
}

class FavouriteCocktailsView extends StatelessWidget {
  const FavouriteCocktailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Избранное',
      currentSelectedNavBarItem: 2,
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          switch (state.status) {
            case FavouritesStatus.initial:
            case FavouritesStatus.loading:
              return const Center(child: CircularProgressCustom());
            case FavouritesStatus.success:
              final favourites = state.favouriteCocktailsMap.values;
              return FavouritesGridView(
                favourites,
              );
            case FavouritesStatus.empty:
              return const FavouritesEmpty();
            case FavouritesStatus.failure:
              return const FavouritesError();
          }
        },
      ),
    );
  }
}
