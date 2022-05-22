import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

import 'package:lesson_21_animations_homework/ui/pages/details/view/cocktail_detail_page.dart';

import 'circular_progress_custom.dart';

class CocktailDetailsLoaderPageWidget extends StatelessWidget {
  final String cocktailId;

  const CocktailDetailsLoaderPageWidget({Key? key, required this.cocktailId})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Material(child: _buildCocktailDetailsPage(context));

  Widget _buildCocktailDetailsPage(BuildContext context) =>
      FutureBuilder<Cocktail?>(
          future: RepositoryProvider.of<RemoteCocktailRepositoryImpl>(context)
              .fetchCocktailDetails(cocktailId),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return CocktailDetailPage(snapshot.data!);
            }

            return const Center(child: CircularProgressCustom());
          });
}
