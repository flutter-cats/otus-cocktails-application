
import 'package:flutter/material.dart';

class CocktailTitle extends StatelessWidget {
  final String cocktailTitle;
  final bool isFavorite;

  CocktailTitle({
    required this.cocktailTitle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cocktailTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
          FavoriteIcon(isFavorite: isFavorite),
        ],
      );

  
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({Key? key, required this.isFavorite}) : super(key: key);
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: isFavorite ? 'is Favorite' : 'not Fovorite',
      child: IconButton(icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color:  Colors.white,),
      onPressed: (){}, ),
    ) ;
  }
}
