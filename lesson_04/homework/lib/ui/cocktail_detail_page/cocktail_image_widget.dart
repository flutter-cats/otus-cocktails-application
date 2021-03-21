import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/show_toast.dart';

class CocktailImage extends StatelessWidget {
  const CocktailImage(this.imageUrl, {Key key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          alignment: Alignment.center,
          child: Image.network(imageUrl),
        ),
        Positioned(top: 5, left: 1, child: _buttonBack(context)),
        Positioned(top: 5, right: 1, child: _buttonOut(context))
      ],
    );
  }
}

Widget _buttonBack(BuildContext context) {
  final String iconBackName = 'assets/images/icon_back.svg';

  return IconButton(
      onPressed: () => showToast("Back Button", context),
      icon: SvgPicture.asset(iconBackName)
  );
}

Widget _buttonOut(BuildContext context) {
  final String iconOutName = 'assets/images/icon_out.svg';

  return  IconButton(
    onPressed: () => showToast("Out Button", context),
    icon: SvgPicture.asset(iconOutName)
  );
}


