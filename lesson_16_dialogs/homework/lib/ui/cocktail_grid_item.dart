import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/ui/detail/cocktail_detail_page.dart';
import '../core/src/res/app_strings.dart';

class CocktailGridItem extends StatelessWidget {
  const CocktailGridItem(this.cocktailDefinition,
      {Key? key, required this.repository})
      : super(key: key);

  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;
  final AsyncCocktailRepository repository;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDetails(context, cocktailDefinition.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.44, 0.94],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(14, 13, 19, 0),
                    Color(0xFF0E0D13),
                  ],
                ),
              ),
              position: DecorationPosition.foreground,
              child: Hero(
                tag: 'cocktailImage${cocktailDefinition.id}',
                child: Image.network(
                  cocktailDefinition.drinkThumbUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cocktailDefinition.name,
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  void _openDetails(BuildContext context, String id) async {
    Cocktail? cocktail;

    cocktail = await repository.fetchCocktailDetails(id);
    if (cocktail != null) {
      _pushCocktailDetailPage(context, cocktail, 3);
    } else {
      _showErrorDialog(
        context,
        AppStrings.fetchErrorTitle,
        AppStrings.fetchErrorContent,
      );
    }
  }
}

void _pushCocktailDetailPage(
    BuildContext context, Cocktail cocktail, int rating) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CocktailDetailPage(
        cocktail,
        rating: rating,
      ),
    ),
  );
}

void _showErrorDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppStrings.errorButtonText)),
        ],
      );
    },
  );
}
