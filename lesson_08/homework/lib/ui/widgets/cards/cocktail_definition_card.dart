import 'package:flutter/material.dart';
import 'package:cocktail/core/models.dart';
import 'package:cocktail/style/style.dart';
import 'package:cocktail/ui/widgets/cocktail/cocktail_image.dart';
import 'package:cocktail/ui/widgets/buttons/favorite_button.dart';

class CocktailDefinitionCard extends StatelessWidget {
  final CocktailDefinition cocktailDefinition;

  CocktailDefinitionCard({
    this.cocktailDefinition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          CoctailImage(
            image: cocktailDefinition.drinkThumbUrl,
            imageFit: CoctailImageFit.fitHeight,
          ),
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(context),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildId(context),
                    FavoriteButton(
                      isFavorite: cocktailDefinition.isFavourite,
                      toggleFavorite: (val) => print('isFavourite = $val'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        cocktailDefinition.name,
        maxLines: 2,
        style: AppTextStyle.primaryText.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildId(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      decoration: BoxDecoration(
        color: AppColors.backgroundHint,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderHint),
      ),
      child: Text(
        'id: ${cocktailDefinition.id}',
        style: AppTextStyle.hintText.copyWith(
          color: AppColors.primaryText,
          fontSize: 10,
        ),
      ),
    );
  }
}
