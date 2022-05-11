import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/main.dart';
import 'package:lesson_21_animations_homework/ui/circular_progress_custom.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/view/cocktail_detail_page.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';

import '../favourite_icon_button.dart';

class CocktailGridItem extends StatelessWidget {
  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;

  const CocktailGridItem(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => FutureBuilder<Cocktail?>(
              future: repository.fetchCocktailDetails(cocktailDefinition.id),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Material(
                    child: CocktailDetailPage(snapshot.data!),
                  );
                }
                return const Center(
                  child: CircularProgressCustom(),
                );
              },
            ),
          ),
        );
      },
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
                        Color(0xFF0E0D13)
                      ])),
              position: DecorationPosition.foreground,
              child: Image.network(
                cocktailDefinition.drinkThumbUrl,
                fit: BoxFit.cover,
                key: const ValueKey('DrinkImage'),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Chip(
                            backgroundColor: CustomColors.black,
                            label: Text(
                              cocktailDefinition.cocktailCategory ?? '-',
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        FavouriteIconButton(cocktail: cocktailDefinition),
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
