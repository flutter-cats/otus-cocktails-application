import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/style/custom_colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class CocktailPreview extends StatelessWidget {
  final Cocktail cocktail;

  CocktailPreview({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 375 / 343,
          child: Image.network(cocktail.drinkThumbUrl!, fit: BoxFit.fill),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.red,
            foregroundDecoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  CustomColors.gradient_first,
                  CustomColors.gradient_second
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
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
                IconButton(
                  onPressed: () {
                    Share.share('Name: ${cocktail.name}\n'
                        'Instruction: ${cocktail.instruction}\n'
                        'Image: ${cocktail.drinkThumbUrl}');
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
