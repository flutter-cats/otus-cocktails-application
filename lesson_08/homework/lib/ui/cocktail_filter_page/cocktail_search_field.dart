import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/app_colors.dart';
import '../../res/app_dimens.dart';
import '../../res/app_strings.dart';

class CocktailSearchField extends StatefulWidget {
  const CocktailSearchField({Key? key}) : super(key: key);

  @override
  State<CocktailSearchField> createState() => _CocktailSearchFieldState();
}

class _CocktailSearchFieldState extends State<CocktailSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.searchFieldHeight,
      padding: AppDimensions.searchFieldPadding,
      margin: AppDimensions.searchFieldMargin,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AppDimensions.searchFieldBorderRadius),
        border: Border.all(color: AppColors.searchFieldBorderColor),
      ),
      child: TextField(
        controller: _controller,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchFieldHint,
          suffixIconConstraints: const BoxConstraints(
              maxHeight: AppDimensions.searchFieldClearIconMaxHeight),
          suffixIcon: GestureDetector(
            onTap: () {
              _controller.clear();
            },
            child: SvgPicture.asset(
              'assets/icon_close.svg',
              width: AppDimensions.searchFieldClearIconSize,
              height: AppDimensions.searchFieldClearIconSize,
              color: AppColors.searchFieldClearIconColor,
            ),
          ),
          suffixIconColor: Colors.white,
          icon: SvgPicture.asset(
            'assets/icon_search.svg',
            width: AppDimensions.searchFieldSearchIconSize,
            height: AppDimensions.searchFieldSearchIconSize,
          ),
        ),
      ),
    );
  }
}
