import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/coctail_detail_page.dart';

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
                    onTap: () {
                      _openCocktailById(
                          context, snapshot.data!.elementAt(index).id);
                    },
                    child: CocktailGridItem(snapshot.data!.elementAt(index)));
              },
              itemCount: snapshot.data!.length);
        }
        return const SizedBox();
      },
    );
  }

  Future<Cocktail?> getCocktailById(String id) async {
    return repository.fetchCocktailDetails(id);
  }

  void _openCocktailById(BuildContext context, String id) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FutureBuilder(
                future: repository.fetchCocktailDetails(id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    if (snapshot.hasData) {
                      return CocktailDetailPage(cocktail: snapshot.data);
                    }

                  }
                  return const SizedBox();
                },
              )),
    );
  }
}
