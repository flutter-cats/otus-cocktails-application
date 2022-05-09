import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/ui/pages/favourites/cubit/favourites_cubit.dart';

class FavouriteCocktailsPage extends StatelessWidget {
  const FavouriteCocktailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavouritesCubit(),
      child: const FavouriteCocktailsPage(),
    );
  }
}
