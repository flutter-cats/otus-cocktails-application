import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/favorite_cocktails_page.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';
import 'package:lesson_21_animations_homework/ui/style/svg_icons.dart';

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
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Drawer(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Flutter Developer'),
              accountEmail: Text('flutter@otus.ru'),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: FlutterLogo(size: 20.0),
              ),
            ),
            ListTile(
              title: Text('О нас'),
              leading: SvgIcons.aboutUs(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: Text('Отзывы'),
              leading: SvgIcons.thumbsUp(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: Text('Язык'),
              leading: SvgIcons.language(CustomColors.headline1),
            ),
            divider,
            ListTile(
              title: Text('Избранное'),
              leading: SvgIcons.favorite(CustomColors.headline1),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => FavouriteCocktailsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
