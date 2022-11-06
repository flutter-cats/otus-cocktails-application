import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  final String iconBack = 'assets/images/icon_back.svg';
  final String iconOut = 'assets/images/icon_out.svg';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.only(
            left: 28,
          ),
          icon: SvgPicture.asset(
            iconBack,
            color: Colors.white,
            width: 16,
            height: 16,
          ),
          onPressed: _pressBack,
        ),
        IconButton(
            padding: EdgeInsets.only(
              right: 20,
            ),
            icon: SvgPicture.asset(
              iconOut,
              color: Colors.white,
              width: 18,
              height: 18,
            ),
            onPressed: _pressOut),
      ],
    );
  }

  void _pressBack() => print('press back');
  void _pressOut() => print('press back');
}
