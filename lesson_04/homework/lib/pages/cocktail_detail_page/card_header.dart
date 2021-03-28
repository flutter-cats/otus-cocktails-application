import 'package:flutter/material.dart';
import 'package:homework/style/app_colors.dart';
import 'package:homework/style/app_text_style.dart';
import 'favorite_button.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key key,
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.cocktailType,
    @required this.glassType,
    @required this.isFavourite,
  }) : super(key: key);

  final String id, name, category, cocktailType, glassType;
  final bool isFavourite;
  final Map<String, String> headerItems = const {
    'category': 'Категория коктейля ',
    'cocktailType': 'Тип коктейля',
    'glassType': 'Тип стекла',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 32,
        left: 32,
        right: 32,
        bottom: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCocktailName(context),
                  FavoriteButton(isFavourite),
                ],
              ),
              _buildCocktailId(context),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            height: 195,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderItem(
                  context,
                  title: headerItems['category'],
                  text: category,
                ),
                _buildHeaderItem(
                  context,
                  title: headerItems['cocktailType'],
                  text: cocktailType,
                ),
                _buildHeaderItem(
                  context,
                  title: headerItems['glassType'],
                  text: glassType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCocktailName(BuildContext context) {
    return Text(
      name,
      style: AppTextStyle.primaryTitle,
    );
  }

  Widget _buildCocktailId(BuildContext context) {
    return Text(
      'id: $id',
      style: AppTextStyle.hintText.copyWith(
        height: 2,
      ),
    );
  }

  Widget _buildHeaderItem(BuildContext context, {title, text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.secondaryText,
        ),
        Container(
          child: Text(
            text,
            style: AppTextStyle.primaryText,
          ),
          decoration: BoxDecoration(
            color: AppColors.select,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.only(
            top: 8,
          ),
          padding: EdgeInsets.only(
            top: 6,
            right: 16,
            bottom: 6,
            left: 16,
          ),
        ),
      ],
    );
  }
}
