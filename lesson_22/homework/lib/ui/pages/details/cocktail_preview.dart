import 'package:cocktail_app/core/src/model/cocktail.dart';
import 'package:cocktail_app/ui/pages/details/cocktail_share_button.dart';
import 'package:flutter/material.dart';

import 'package:cocktail_app/ui/style/custom_colors.dart';

class CocktailPreview extends StatelessWidget {
  final Cocktail cocktail;

  CocktailPreview({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 375 / 343,
          child: Image.network(cocktail.drinkThumbUrl, fit: BoxFit.fill),
        ),
        Positioned(
            bottom: 0,
            top: 0,
            child: Column(
              children: [
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AspectRatio(
                        aspectRatio: 375 / 172,
                        child: Container(
                          color: Colors.transparent,
                          foregroundDecoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [CustomColors.gradient_first, CustomColors.gradient_second], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                        ),
                      )),
                )
              ],
            )),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CocktailShareButton(cocktail: cocktail),
              ],
            ),
          ),
        )
      ],
    );
  }
}
