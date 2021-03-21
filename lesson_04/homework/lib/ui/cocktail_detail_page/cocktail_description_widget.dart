import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/res/application_colors.dart';
import 'package:homework/res/strings.dart';

const Color myColor = Color.fromARGB(32, 31, 44, 1);

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
    final idStyle = TextStyle(
        color: ApplicationColors.idColor,
        fontFamily: 'SF Pro Text',
        fontSize: 13);

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
              trailing: _isFavorite(),
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

Widget _isFavorite() {
  final String widgetName = 'assets/images/icon_hart.svg';

  return SvgPicture.asset(widgetName);
}

Widget _descriptionItem(String itemName, String itemValue) {

  final nameStyle = TextStyle(fontFamily: 'SF Pro Text', color: Colors.white70, fontSize: 14);
  final valueStyle = TextStyle(fontFamily: 'SF Pro Text', color: Colors.white70, fontSize: 15);

  return Container(
    padding: EdgeInsets.symmetric(vertical: 33, horizontal: 32),
    child: Column(
      children: [
        Text(itemName.trim(), style: nameStyle,),
        Text(itemValue.trim(), style: valueStyle,)
      ],
    ),
  );
}
