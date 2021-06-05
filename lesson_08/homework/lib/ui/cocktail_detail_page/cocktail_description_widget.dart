import 'package:cocktail/res/application_colors.dart';
import 'package:cocktail/res/strings.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDescription extends StatelessWidget {
  const CocktailDescription(
      this.name, this.id, this.isFavorite, this.category, this.type, this.glass,
      {Key key})
      : super(key: key);

  final String name;
  final String id;
  final String category;
  final String type;
  final String glass;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(color: Colors.white, fontSize: 20);
    final idStyle = TextStyle(color: ApplicationColors.idColor, fontSize: 13);

    return Container(
        color: ApplicationColors.backgroundDescription,
        padding: EdgeInsets.fromLTRB(32, 33, 32, 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                name,
                style: nameStyle,
              ),
              trailing: _isFavorite(context),
            ),
            Text(
              '${Strings.id}:$id',
              style: idStyle,
            ),
            _descriptionItem(Strings.category, category),
            _descriptionItem(Strings.type, type),
            _descriptionItem(Strings.glass, glass)
          ],
        ));
  }
}

Widget _isFavorite(BuildContext context) {
  final String widgetName = 'assets/images/icon_hart.svg';

  return IconButton(onPressed: () => {}, icon: SvgPicture.asset(widgetName)); //
}

Widget _descriptionItem(String itemName, String itemValue) {
  final nameStyle = TextStyle(color: Colors.white70, fontSize: 14);
  final valueStyle = TextStyle(color: Colors.white, fontSize: 15);

  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemName,
          style: nameStyle,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: ApplicationColors.itemDescriptionBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              itemValue,
              style: valueStyle,
            ),
          ),
        ),
      ],
    ),
  );
}
