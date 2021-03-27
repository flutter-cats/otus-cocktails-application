import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/style/app-colors.dart';

import 'top_bar.dart';
import 'cocktail_image.dart';
import 'card_header.dart';
import 'cocktail_ingredients.dart';
import 'instruction.dart';
import 'raiting.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: Builder(builder: _buildBody),
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    final double minHeight = 300;
    final double height = 343;

    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          title: TopBar(),
          floating: false,
          snap: false,
          pinned: true,
          expandedHeight: minHeight,
          forceElevated: innerBoxIsScrolled,
          backgroundColor: AppColors.surface,
          flexibleSpace: SizedBox(
            height: height,
            child: CoctailImage(
              image: cocktail.drinkThumbUrl,
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    final raiting = 3;

    return Container(
      color: AppColors.background,
      margin: EdgeInsets.only(top: 95),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: CardHeader(
              id: cocktail.id,
              name: cocktail.name,
              category: cocktail.category.name,
              cocktailType: cocktail.category.name,
              glassType: cocktail.glassType.name,
              isFavourite: cocktail.isFavourite,
            ),
          ),
          SliverToBoxAdapter(
            child: CocktailIngredients(
              ingredients: cocktail.ingredients,
            ),
          ),
          SliverToBoxAdapter(
            child: Instruction(
              instruction: cocktail.instruction,
            ),
          ),
          SliverToBoxAdapter(
            child: Raiting(
              raiting: raiting,
            ),
          ),
        ],
      ),
    );
  }
}
