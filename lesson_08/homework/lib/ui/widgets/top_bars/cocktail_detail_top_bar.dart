import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocktail/style/style.dart';

class CocktailDetailTopBar extends StatelessWidget {
  const CocktailDetailTopBar({Key key}) : super(key: key);

  final String _backIcon = 'assets/images/icons/icon_back.svg';
  final String _outIcon = 'assets/images/icons/icon_out.svg';

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
            _backIcon,
            color: AppColors.primaryText,
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
              _outIcon,
              color: AppColors.primaryText,
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
