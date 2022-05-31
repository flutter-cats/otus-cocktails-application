
import 'package:flutter/material.dart';
import '../../../../core/models.dart';
import '../get_is_favorite_icon.dart';

class CocktailTitle extends StatelessWidget {
  final Cocktail cocktail;
 

  CocktailTitle({required this.cocktail,});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            cocktail.name ?? '', maxLines: 3,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        GetIsFavoriteIcon( cocktail: cocktail,),
      ],
    );
  }

  
}

