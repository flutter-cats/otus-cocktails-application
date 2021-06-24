import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/coctail_detail_page.dart';

import 'cocktail_grid_item.dart';

//todo по нажатию на CocktailGridItem открыть CocktailDetailsScreen

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
    var shouldAbsorb = false;
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
                return AbsorbPointer(
                  absorbing: false,
                  child: GestureDetector(
                    child: CocktailGridItem(snapshot.data!.elementAt(index)),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => FutureBuilder<Cocktail?>(
                            future: repository.fetchCocktailDetails(
                                snapshot.data!.elementAt(index).id),
                            builder: (ctx, snapshot) {
                              if (snapshot.hasData) {
                                return Material(
                                  child: CocktailDetailPage(snapshot.data!),
                                );
                              }
                              if (snapshot.hasError) {
                                return Container(
                                    color: Color.fromARGB(255, 26, 25, 39),
                                    child: AlertDialog(
                                      title: const Text('Data fetching error'),
                                      content: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ));
                              }
                              return Container(
                                color: Color.fromARGB(255, 26, 25, 39),
                                child: Center(
                                  child: const CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: snapshot.data!.length);
        }
        return Center(
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
