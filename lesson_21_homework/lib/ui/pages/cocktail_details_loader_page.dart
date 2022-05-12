import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/circular_progress_custom.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/view/cocktail_detail_page.dart';

class CocktailDetailsLoaderPageWidget extends StatefulWidget {
  final String cocktailId;

  const CocktailDetailsLoaderPageWidget({Key? key, required this.cocktailId})
      : super(key: key);

  @override
  _CocktailDetailsLoaderPageWidgetState createState() =>
      _CocktailDetailsLoaderPageWidgetState();
}

class _CocktailDetailsLoaderPageWidgetState
    extends State<CocktailDetailsLoaderPageWidget> {
  @override
  Widget build(BuildContext context) =>
      Material(child: _buildCocktailDetailsPage(context));

  Widget _buildCocktailDetailsPage(BuildContext context) =>
      FutureBuilder<Cocktail?>(
          future: RepositoryProvider.of<AsyncCocktailRepository>(context)
              .fetchCocktailDetails(widget.cocktailId),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return CocktailDetailPage(snapshot.data!);
            }

            return const Center(child: CircularProgressCustom());
          });
}
