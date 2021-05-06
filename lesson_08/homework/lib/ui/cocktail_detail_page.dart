import 'package:flutter/material.dart';
import 'package:cocktail/core/models.dart';
import 'package:cocktail/core/src/repository/async_cocktail_repository.dart';
import 'package:cocktail/style/style.dart';

import 'package:cocktail/ui/widgets/top_bars/cocktail_detail_top_bar.dart';
import 'package:cocktail/ui/widgets/cocktail/cocktail_image.dart';
import 'package:cocktail/ui/widgets/cocktail/cocktail_ingredients.dart';
import 'package:cocktail/ui/widgets/cocktail/cocktail_instruction.dart';
import 'package:cocktail/ui/widgets/headers/cocktail_detail_header.dart';

import 'package:cocktail/ui/widgets/raitings/stars_raiting.dart';

class CocktailDetailPage extends StatefulWidget {
  final String id;
  CocktailDetailPage({this.id});
  @override
  _CocktailDetailPageState createState() => _CocktailDetailPageState(
        id: this.id,
      );
}

class _CocktailDetailPageState extends State<CocktailDetailPage> {
  _CocktailDetailPageState({
    this.id,
  });

  final String id;
  final String _loadingMessage = 'Loading ...';
  final String _noDataMessage = 'No data';
  // State variables
  Cocktail _cocktail;

  Future<Cocktail> fetchCocktailDetails() async {
    final cocktail = await AsyncCocktailRepository().fetchCocktailDetails(id);
    _cocktail = cocktail;
    return cocktail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: FutureBuilder(
        future: fetchCocktailDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Has error
          if (snapshot.hasError) {
            return _buildMessage(context, snapshot.error.toString());
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return _buildMessage(context, _loadingMessage);

              case ConnectionState.done:
                if (snapshot.hasData == null || _cocktail == null) {
                  return _buildMessage(context, _noDataMessage);
                }

                return _buildContent(context);

              default:
                return _buildMessage(context, _noDataMessage);
            }
          }
        },
      ),
    ));
  }

  Widget _buildMessage(BuildContext context, message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: AppColors.primaryText),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: _buildContentHeader,
      body: Builder(builder: _buildBody),
    );
  }

  List<Widget> _buildContentHeader(
      BuildContext context, bool innerBoxIsScrolled) {
    final double minHeight = 300;
    final double height = 343;

    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          title: CocktailDetailTopBar(),
          floating: false,
          snap: false,
          pinned: true,
          expandedHeight: minHeight,
          forceElevated: innerBoxIsScrolled,
          backgroundColor: AppColors.surface,
          flexibleSpace: SizedBox(
            height: height,
            child: CoctailImage(
              image: _cocktail.drinkThumbUrl,
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
            child: CocktailDetailHeader(
              id: _cocktail.id,
              name: _cocktail.name,
              category: _cocktail.category.value,
              cocktailType: _cocktail.cocktailType.value,
              glassType: _cocktail.glassType.value,
              isFavourite: _cocktail.isFavourite,
            ),
          ),
          SliverToBoxAdapter(
            child: CocktailIngredients(
              ingredients: _cocktail.ingredients,
            ),
          ),
          SliverToBoxAdapter(
            child: CocktailInstruction(
              instruction: _cocktail.instruction,
            ),
          ),
          SliverToBoxAdapter(
            child: StarsRaiting(
              raiting: raiting,
            ),
          ),
        ],
      ),
    );
  }
}
