import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'cocktail_grid_item.dart';

class FavouriteCocktailsScreen extends StatelessWidget {
  const FavouriteCocktailsScreen(
    this.repository, {
    Key? key,
  }) : super(key: key);

  final AsyncCocktailRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildCocktailItems(context),
      ),
    );
  }

  Widget _buildCocktailItems(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition>>(
      future: repository.getFavouriteCocktails(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData) {
          return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2),
              itemBuilder: (ctx, index) {
                return CocktailGridItem(
                  snapshot.data!.elementAt(index),
                  repository: repository,
                );
              },
              itemCount: snapshot.data!.length);
        }
        return const SizedBox();
      },
    );
  }
}
