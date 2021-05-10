import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/core/src/repository/async_cocktail_repository.dart';

import 'cocktail_grid_item.dart';
import 'coctail_detail_page.dart';
//todo по нажатию на CocktailGridItem открыть CocktailDetailsScreen

class FavouriteCocktailsScreen extends StatelessWidget {
  FavouriteCocktailsScreen(
    this.repository, {
    Key? key,
  }) : super(key: key);

  final AsyncCocktailRepository repository;
  late List<CocktailDefinition> _coctails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildCocktailItems(context),
      ),
    );
  }

  // Need add activity indicator on the grid item when fetching recipe details

  // Funcs

  void _tapGridItem(int index, BuildContext context) async {
    print("Index $index");
    _onLoading(context);
    final coctailID = _coctails[index].id;

    final coctailDefinitaion = await repository.fetchCocktailDetails(coctailID);
    // Need
    _loadedComleted(context);
    if (coctailDefinitaion != null) {
      Navigator.of(context).push(MaterialPageRoute(
          settings: RouteSettings(name: "Cocatil Details"),
          builder: (context) {
            return CocktailDetailPage(coctailDefinitaion);
          }));
    }
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void _loadedComleted(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildCocktailItems(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition>>(
      future: repository.getFavouriteCocktails(),
      builder: (ctx, snapshot) {
        _coctails = snapshot.data?.toList() ?? [];
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
                    onTap: () => _tapGridItem(index, context),
                    child: CocktailGridItem(snapshot.data!.elementAt(index)));
              },
              itemCount: snapshot.data!.length);
        }
        return const SizedBox();
      },
    );
  }
}
