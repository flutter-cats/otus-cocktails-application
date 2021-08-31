import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/favorites/favorites_cubit.dart';

import '../cocktails/cocktail_grid_item.dart';
import '../cocktails/cocktails_grid_delegate.dart';
import '../root_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final builder =
        BlocBuilder<FavoritesCubit, FavoritesState>(builder: (context, state) {
      final favorites = state.favoritesMap.values;
      if (favorites.isNotEmpty) {
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: cocktailsGridDelegate,
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return CocktailGridItem(
                favorites.elementAt(index));
          },
        );
      }

      return const Center(child: Text('Ничего не добавлено'));
    });
    return builder;
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoritesCubit, FavoritesState>(
            listenWhen: (last, next) =>
                (last.favoritesMap.length > next.favoritesMap.length) &&
                next.favoritesMap.isNotEmpty,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Удалили')),
              );
            }),
        BlocListener<FavoritesCubit, FavoritesState>(
            listenWhen: (last, next) => next.favoritesMap.isEmpty,
            listener: (context, state) {
              // Только для примера
              context.findAncestorStateOfType<RootPageState>()?.setState(() {
                context.findAncestorStateOfType<RootPageState>()?.currentIndex =
                    0;
              });
            })
      ],
      child: builder,
    );
  }
}
