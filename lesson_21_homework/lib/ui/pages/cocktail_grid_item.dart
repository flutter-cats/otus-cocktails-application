import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/main.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cocktail_detail_page.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/cubit/favourites_cubit.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';

class CocktailGridItem extends StatelessWidget {
  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;

  final CocktailCategory selectedCategory;

  const CocktailGridItem(
    this.cocktailDefinition, {
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => FutureBuilder<Cocktail?>(
              future: repository.fetchCocktailDetails(cocktailDefinition.id!),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Material(
                    child: CocktailDetailPage(snapshot.data!),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
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
                cocktailDefinition.drinkThumbUrl ?? '',
                fit: BoxFit.cover,
                key: ValueKey('DrinkImage'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cocktailDefinition.name ?? '',
                      style: Theme.of(context).textTheme.bodyText1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Chip(
                            backgroundColor: CustomColors.black,
                            label: Text(
                              selectedCategory.name,
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        FavouriteIcon(cocktail: cocktailDefinition)
                        // BlocBuilder<FavouritesCubit, FavouritesState>(
                        //   builder: (context, state) {
                        //     return _getIsFavoriteIcon(
                        //         context, false, cocktailDefinition);
                        //   },
                        // ),
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//   Widget _getIsFavoriteIcon(
//       BuildContext context, bool isFavourite, CocktailDefinition cocktail) {
//     final cubit = context.read<FavouritesCubit>();
//     if (isFavourite) {
//       return IconButton(
//         icon: Icon(Icons.favorite, color: Colors.white),
//         onPressed: () {},
//       );
//     } else {
//       return IconButton(
//         icon: Icon(Icons.favorite_border, color: Colors.white),
//         onPressed: () {
//           cubit.addToFavourite(cocktail);
//         },
//       );
//     }
//   }
// }
}

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({Key? key, required this.cocktail}) : super(key: key);

  final CocktailDefinition cocktail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final cubit = context.read<FavouritesCubit>();
        if (cubit.items.containsKey(cocktail.id)) {
          return IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              cubit.removeFromFavourite(cocktail.id!);
            },
          );
        } else {
          return IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              cubit.addToFavourite(cocktail.id!, cocktail);
            },
          );
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final cubit = context.read<FavouritesCubit>();
  //   final select =
  //       context.select((FavouritesCubit cubit) => cubit.state.cocktailsList);
  //   if (select.containsKey(cocktail.id)) {
  //     return IconButton(
  //       icon: Icon(Icons.favorite, color: Colors.white),
  //       onPressed: () {
  //         cubit.removeFromFavourite(cocktail.id!);
  //       },
  //     );
  //   } else {
  //     return IconButton(
  //       icon: Icon(Icons.favorite_border, color: Colors.white),
  //       onPressed: () {
  //         cubit.addToFavourite(cocktail.id!, cocktail);
  //       },
  //     );
  //   }
  // }
}
