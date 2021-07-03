import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';
import 'package:cocktail/ui/widgets/cocktail/cocktail_title.dart';
import 'package:cocktail/ui/widgets/buttons/favorite_button.dart';

class CocktailDetailHeader extends StatefulWidget {
  CocktailDetailHeader({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.cocktailType,
    @required this.glassType,
    @required this.isFavourite,
  });

  final String id, name, category, cocktailType, glassType;
  final bool isFavourite;

  @override
  _CocktailDetailHeaderState createState() => _CocktailDetailHeaderState(
        id: this.id,
        name: this.name,
        category: this.category,
        cocktailType: this.cocktailType,
        glassType: this.glassType,
        isFavourite: this.isFavourite,
      );
}

class _CocktailDetailHeaderState extends State<CocktailDetailHeader> {
  _CocktailDetailHeaderState({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.cocktailType,
    @required this.glassType,
    @required this.isFavourite,
  });

  final String id, name, category, cocktailType, glassType;
  final bool isFavourite;
  final Map<String, String> headerItems = const {
    'category': 'Категория коктейля ',
    'cocktailType': 'Тип коктейля',
    'glassType': 'Тип стекла',
  };
  // State variables
  bool _isFavourite;

  @override
  void initState() {
    super.initState();
    _isFavourite = isFavourite;
  }

  void _toggleFavorite(isFavourite) {
    setState(() => _isFavourite = isFavourite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 32, 32, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CocktailTitle(
                id: id,
                name: name,
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: FavoriteButton(
                  isFavorite: _isFavourite,
                  toggleFavorite: _toggleFavorite,
                ),
              ),
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
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
        ),
      ],
    );
  }
}
