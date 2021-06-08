import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cocktails_mobx/app/state/favorites/favorites_store.dart';
import 'package:provider/provider.dart';

import '../cocktails/cocktail_grid_item.dart';
import '../cocktails/cocktails_grid_delegate.dart';

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
    return Observer(
      builder: (context) {
        final favoritesStore = Provider.of<FavoritesStore>(context);
        final favorites = favoritesStore.favoritesMap.values;

        if (favorites.isNotEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: cocktailsGridDelegate,
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CocktailGridItem(favorites.elementAt(index));
            },
          );
        }

        return Center(child: Text('Ничего не добавлено'));
      },
    );
  }
}
