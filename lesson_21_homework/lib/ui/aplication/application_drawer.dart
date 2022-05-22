import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/details/cubit/rating_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/cubit/favourites_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/view/favorite_cocktails_page.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';
import 'package:lesson_21_animations_homework/ui/style/svg_icons.dart';
import 'package:provider/provider.dart';

class ApplicationDrawer extends StatelessWidget {
  const ApplicationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: CustomColors.divider.withOpacity(.2),
      height: 5,
      thickness: 1,
      indent: 4,
      endIndent: 4,
    );

    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Drawer(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Flutter Developer'),
              accountEmail: const Text('flutter@otus.ru'),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: const FlutterLogo(size: 20.0),
              ),
            ),
            ListTile(
              title: const Text('О нас'),
              leading: SvgIcons.aboutUs(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: const Text('Отзывы'),
              leading: SvgIcons.thumbsUp(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: const Text('Язык'),
              leading: SvgIcons.language(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: const Text('Избранное'),
              leading: SvgIcons.favorite(CustomColors.headline1),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const FavouriteCocktailsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Очистить Избранное'),
              leading: SvgIcons.favorite(CustomColors.headline1),
              onTap: () {
                context.read<FavouritesCubit>().clearFavourites();
              },
            ),
            ListTile(
              title: const Text('Очистить рейтинг'),
              leading: const Icon(
                Icons.star,
                color: CustomColors.headline1,
              ),
              onTap: () {
                context.read<RatingCubit>().clearRating();
              },
            ),
          ],
        ),
      ),
    );
  }
}
