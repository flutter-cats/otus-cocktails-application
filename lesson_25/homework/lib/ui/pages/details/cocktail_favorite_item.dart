import 'package:flutter/material.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_favorite_button.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/style/custom_colors.dart';

class CocktailFavoriteItem extends StatelessWidget {
  final CocktailDefinition value;
  final BuildContext context;

  const CocktailFavoriteItem({required this.context, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 215,
      width: 160,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration:
                const BoxDecoration(gradient: LinearGradient(stops: [0.44, 0.94], begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromRGBO(14, 13, 19, 0), Color(0xFF0E0D13)])),
            position: DecorationPosition.foreground,
            child: Image.network(
              value.drinkThumbUrl ?? '',
              fit: BoxFit.fitHeight,
              key: ValueKey('DrinkImage'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 3),
                child: Text(value.name!, textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 16, right: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                            child: Text('${value.categoryName}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400)),
                          ),
                          decoration: BoxDecoration(
                              color: CustomColors.value_text,
                              border: Border.all(
                                color: CustomColors.category,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30)))),
                      Spacer(),
                      CocktailFavoriteButton(value)
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
