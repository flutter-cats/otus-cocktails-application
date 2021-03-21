import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/models/models.dart';
import 'package:homework/style/app-colors.dart';
import 'package:homework/style/app-text-style.dart';

import '../../models/models.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                _CocktailCard(cocktail: cocktail),
              ],
            ),
            Positioned(
              child: _TopBar(),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({Key key}) : super(key: key);
  final String _iconBack = 'assets/images/icon_back.svg';
  final String _iconOut = 'assets/images/icon_out.svg';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.only(
          left: 28,
        ),
        icon: SvgPicture.asset(
          _iconBack,
          color: Colors.white,
          width: 16,
          height: 16,
        ),
        onPressed: _pressBack,
      ),
      actions: [
        IconButton(
            padding: EdgeInsets.only(
              right: 20,
            ),
            icon: SvgPicture.asset(
              _iconOut,
              color: Colors.white,
              width: 18,
              height: 18,
            ),
            onPressed: _pressOut),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  void _pressBack() => print('press back');
  void _pressOut() => print('press back');
}

class _CocktailCard extends StatelessWidget {
  const _CocktailCard({Key key, this.cocktail}) : super(key: key);
  final Cocktail cocktail;
  final Map<String, String> headerItems = const {
    'category': 'Категория коктейля ',
    'cocktailType': 'Тип коктейля',
    'glassType': 'Тип стекла',
  };
  final ingredientTitle = 'Ингредиенты:';
  final instructionTitle = 'Инструкция для приготовления';
  final int maxRatingCount = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildCoctailImage(context),
          _buildCardHeader(context),
          _buildIngredients(context),
          _buildInstruction(context),
          _buildRaiting(context),
        ],
      ),
    );
  }

  Widget _buildCoctailImage(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.network(
              cocktail.drinkThumbUrl,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                final progress = (loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes);
                return Center(
                  child: Column(
                    children: [
                      Text('${(progress * 100).toInt()} %'),
                      const SizedBox(
                        height: 16,
                      ),
                      CircularProgressIndicator(value: progress)
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                child: Text(
                  'Loading image error',
                  style: AppTextStyle.errorText,
                ),
                margin: EdgeInsets.only(
                  top: 100,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(14, 13, 19, 0),
                  Colors.black,
                ],
              ),
            ),
          ),
        ],
      ),
      height: 343,
    );
  }

  Widget _buildCardHeader(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  _buildCocktailName(context),
                  _buildCocktailId(context),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              _FavoriteButton(cocktail.isFavourite)
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            height: 195,
            child: Column(
              children: [
                _buildHeaderItem(
                  context,
                  title: headerItems['category'],
                  text: cocktail.category.name,
                ),
                _buildHeaderItem(
                  context,
                  title: headerItems['cocktailType'],
                  text: cocktail.cocktailType.name,
                ),
                _buildHeaderItem(
                  context,
                  title: headerItems['glassType'],
                  text: cocktail.glassType.name,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.only(
        top: 32,
        left: 32,
        right: 32,
        bottom: 18,
      ),
    );
  }

  Widget _buildCocktailName(BuildContext context) {
    return Text(
      cocktail.name,
      style: AppTextStyle.primaryTitle,
    );
  }

  Widget _buildCocktailId(BuildContext context) {
    return Text(
      'id: ${cocktail.id}',
      style: AppTextStyle.hintText.merge(
        TextStyle(
          height: 2,
        ),
      ),
    );
  }

  Widget _buildHeaderItem(BuildContext context, {title, text}) {
    return Column(
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
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _buildIngredients(BuildContext context) {
    List<Widget> data = []
      ..add(
        Container(
          child: Text(
            ingredientTitle,
            style: AppTextStyle.secondaryTitle,
          ),
          padding: EdgeInsets.only(
            bottom: 24,
          ),
        ),
      )
      ..addAll(cocktail.ingredients.map((ingraient) => _buildIngredient(
            context,
            name: ingraient.ingredientName,
            measure: ingraient.measure,
          )));

    return Container(
      child: Column(
        children: data,
      ),
      padding: EdgeInsets.only(
        top: 24,
        right: 36,
        bottom: 24,
        left: 36,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
      ),
    );
  }

  Widget _buildIngredient(BuildContext context, {name, measure}) {
    return Row(
      children: [
        Text(
          name,
          style: AppTextStyle.primaryText.merge(
            TextStyle(
              height: 2,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          measure,
          style: AppTextStyle.primaryText.merge(
            TextStyle(
              height: 2,
            ),
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _buildInstruction(BuildContext context) {
    List<Widget> data = []
      ..add(
        Container(
          child: Text(
            instructionTitle,
            style: AppTextStyle.primaryText,
          ),
          padding: EdgeInsets.only(
            bottom: 24,
            left: 12,
          ),
        ),
      )
      ..addAll(cocktail.instruction.split('-').sublist(1).map(
            (text) => Row(
              children: [
                Text(
                  '\u2022',
                  style: AppTextStyle.primaryText,
                ),
                SizedBox(
                  // 78 = padding.right(32) + padding.left(32) + fontSize(14)
                  width: MediaQuery.of(context).size.width - 78,
                  child: Text(
                    text,
                    style: AppTextStyle.primaryText,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ));

    return Container(
      child: Column(
        children: data,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      padding: EdgeInsets.only(
        top: 24,
        right: 32,
        bottom: 40,
        left: 32,
      ),
      alignment: Alignment.topLeft,
    );
  }

  Widget _buildRaiting(BuildContext context) {
    final raiting = 3;

    List<Widget> raitingList = [];
    for (var i = 0; i < maxRatingCount; i++) {
      raitingList.add(_RatingItem(i < raiting));
    }

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: 24,
        right: 36,
        bottom: 24,
        left: 36,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: raitingList,
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  final bool isFavorited;
  _FavoriteButton(this.isFavorited);
  @override
  _FavoriteButtonWidgetState createState() =>
      _FavoriteButtonWidgetState(isFavorited);
}

class _FavoriteButtonWidgetState extends State<_FavoriteButton> {
  bool _isFavorited;
  final String iconHart = 'assets/images/icon_hart.svg';
  _FavoriteButtonWidgetState(isFavorited) {
    _isFavorited = isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: SvgPicture.asset(
          iconHart,
          color:
              _isFavorited ? Colors.white : Color.fromRGBO(255, 255, 255, 0.3),
        ),
        color: Colors.green,
        onPressed: _toggleFavorite,
      ),
    );
  }

  void _toggleFavorite() {
    setState(() => _isFavorited = !_isFavorited);
  }
}

class _RatingItem extends StatelessWidget {
  const _RatingItem(
    this.isSelected, {
    Key key,
  }) : super(key: key);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 48,
        height: 48,
        margin: EdgeInsets.all(10),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.hintText),
        child: Icon(
          Icons.star,
          color: isSelected ? AppColors.primaryText : AppColors.background,
          size: 32,
        ));
  }
}
