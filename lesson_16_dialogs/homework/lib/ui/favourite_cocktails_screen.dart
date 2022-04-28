import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/cocktail_detail_page/coctail_detail_page.dart';

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

  _navigateDetailPage(
      BuildContext context, CocktailDefinition cocktailDefinition) async {
    Cocktail? cocktail =
        await repository.fetchCocktailDetails(cocktailDefinition.id);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CocktailDetailPage(cocktail!),
      ),
    );
  }

  Widget _buildCocktailItems(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition>>(
      future: repository.getFavouriteCocktails(),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.hasData) {
          return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  child: CocktailGridItem(snapshot.data!.elementAt(index)),
                  onTap: () => _navigateDetailPage(
                      context, snapshot.data!.elementAt(index)),
                );
              },
              itemCount: snapshot.data!.length);
        }
        return const SizedBox();
      },
    );
  }
}
