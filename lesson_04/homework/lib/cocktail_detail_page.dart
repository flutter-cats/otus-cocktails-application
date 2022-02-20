import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  static const Color _firstStyleBackgroundColor = Colors.black;
  static const Color _secondStyleBackgroundColor =
      const Color.fromRGBO(26, 25, 39, 1);
  static const Color _thirdStyleBackgroundColor =
      const Color.fromRGBO(32, 31, 44, 1);

  static const EdgeInsets _blockPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 30);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = (MediaQuery.of(context));
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildImageBlock(this.cocktail.drinkThumbUrl, mediaQuery.size),
          _buildInfoBlock(this.cocktail, theme),
          _buildIngredientsBlock(this.cocktail.ingredients, theme),
          _buildInstructionBlock(this.cocktail.instruction, theme),
          _buildRatingBlock(theme),
        ],
      ),
    );
  }

  Widget _buildImageBlock(String imageUrl, Size mediaQuerySize) {
    const topIconPosition = 26.0;
    const sideIconPosition = 16.0;

    return Container(
      constraints: BoxConstraints(
        minWidth: 0,
        minHeight: 0,
        maxHeight: mediaQuerySize.width,
        maxWidth: mediaQuerySize.width,
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            top: topIconPosition,
            left: sideIconPosition,
            child: SvgPicture.asset('assets/images/icon_back.svg',
                semanticsLabel: 'Back'),
          ),
          Positioned(
            top: topIconPosition,
            right: sideIconPosition,
            child: SvgPicture.asset('assets/images/icon_out.svg',
                semanticsLabel: 'Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(Cocktail cocktail, ThemeData theme) {
    const sizedBoxHeight = 12.0;
    final textTheme = theme.textTheme;

    Widget _buildNameValueItem(String name, String value) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            color: const Color.fromRGBO(21, 21, 28, 1),
            child: Text(value),
          ),
        ),
      ]);
    }

    ;

    return Container(
      color: _secondStyleBackgroundColor,
      padding: _blockPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cocktail.name, style: textTheme.headline5),
              SvgPicture.asset('assets/images/icon_hart.svg',
                  semanticsLabel: 'Favourite'),
            ],
          ),
          SizedBox(height: sizedBoxHeight),
          Text(
            'Id: ${cocktail.id}',
            style: TextStyle(color: theme.disabledColor),
          ),
          SizedBox(height: sizedBoxHeight),
          _buildNameValueItem("Категория коктейля", cocktail.category.value),
          SizedBox(height: sizedBoxHeight),
          _buildNameValueItem("Тип коктейля", cocktail.cocktailType.value),
          SizedBox(height: sizedBoxHeight),
          _buildNameValueItem("Тип стекла", cocktail.glassType.value),
        ],
      ),
    );
  }

  Widget _buildIngredientsBlock(
      Iterable<IngredientDefinition> ingredients, ThemeData theme) {
    const sizedBoxHeight = 12.0;
    final textTheme = theme.textTheme;

    Widget _buildIngredientItem(IngredientDefinition item) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.ingredientName,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.transparent,
                decorationColor: textTheme.bodyText2.color,
                shadows: [
                  Shadow(
                      color: textTheme.bodyText2.color, offset: Offset(0, -3))
                ]),
          ),
          Text(
            item.measure,
          ),
        ],
      );
    }

    ;

    //формируем ингредиенты
    var ingredientWidgets = [];
    for (var item in ingredients) {
      ingredientWidgets.add(_buildIngredientItem(item));
      ingredientWidgets.add(SizedBox(height: sizedBoxHeight));
    }

    if (ingredientWidgets.length > 0) ingredientWidgets.removeLast();

    return Container(
      color: _firstStyleBackgroundColor,
      padding: _blockPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Ингредиенты:',
              style: textTheme.headline6
                  .copyWith(color: const Color.fromRGBO(177, 175, 198, 1)),
            ),
          ),
          SizedBox(height: _blockPadding.top),
          ...ingredientWidgets
        ],
      ),
    );
  }

  Widget _buildInstructionBlock(String instruction, ThemeData theme) {
    const sizedBoxHeight = 12.0;
    final textTheme = theme.textTheme;

    Widget _buildInstructionItem(String instruction) {
      return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: -10,
              child: Text("\u2022"),
            ),
            Text(instruction),
          ]);
    }

    ;

    var instructionWidgets = [];
    var instructions = instruction.split('\n-');
    if (instructions.length > 0 && instructions[0].startsWith("-"))
      instructions[0] = instructions[0].substring(1);
    for (var item in instructions) {
      instructionWidgets.add(_buildInstructionItem(item.trim()));
      instructionWidgets.add(SizedBox(height: sizedBoxHeight));
    }

    if (instructionWidgets.length > 0) instructionWidgets.removeLast();

    return Container(
      color: _thirdStyleBackgroundColor,
      padding: _blockPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Инструкция для приготовления',
          ),
          SizedBox(height: _blockPadding.top),
          ...instructionWidgets,
        ],
      ),
    );
  }

  Widget _buildRatingBlock(ThemeData theme) {
    const starCount = 5;
    const activeStarCount = 3;

    Widget _buildStarItem(bool isActive) {
      return Container(
        decoration: ShapeDecoration(
            color: Color.fromRGBO(42, 41, 58, 1), shape: CircleBorder()),
        padding: EdgeInsets.all(10),
        child: FittedBox(
          child: new Icon(
            Icons.star,
            color: isActive
                ? theme.textTheme.bodyText2.color
                : _secondStyleBackgroundColor,
          ),
          fit: BoxFit.fitWidth,
        ),
      );
    }

    ;

    return Container(
        color: _secondStyleBackgroundColor,
        padding: _blockPadding,
        child: Row(
          children: [
            ...List.generate(
                starCount * 2 - 1,
                (index) => index % 2 == 0
                    ? Expanded(
                        child: _buildStarItem(index < activeStarCount * 2),
                        flex: 3)
                    : Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ))
          ],
        ));
  }
}
