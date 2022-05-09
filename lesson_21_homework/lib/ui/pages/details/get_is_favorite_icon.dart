import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models.dart';
import '../../../core/src/cubit/favorits_cubit.dart';

class GetIsFavoriteIcon extends StatelessWidget {
  const GetIsFavoriteIcon({Key? key, required this.cocktail}) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritsCubit, FavoritsState, List<Cocktail>>(
      selector: (state) {
        return state.list;
      },
      builder: (context, list) {
        return IconButton(
          icon: Icon(
              (list.any((e) => e.id == cocktail.id)) ? Icons.favorite : Icons.favorite_border,
              color: Colors.white),
          onPressed: () {
            BlocProvider.of<FavoritsCubit>(context)
                .addOrRemoveFavorit(cocktail);
          },
        );
      },
    );
  }
}
