import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/ui/pages/categories_fitler_bar_delegate.dart';
import 'package:lesson_21_animations_homework/ui/pages/filter/view/filter_results_page.dart';
import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/cubit/random_cubit.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/widgets/random_failure.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/widgets/random_loading.dart';
import 'package:lesson_21_animations_homework/ui/pages/random/widgets/random_success.dart';

class RandomCocktailPage extends StatelessWidget {
  const RandomCocktailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RandomCubit(
            RepositoryProvider.of<RemoteCocktailRepositoryImpl>(context))
          ..fetchRandomCocktail(),
        child: RandomCocktailView());
  }
}

class RandomCocktailView extends StatelessWidget {
  const RandomCocktailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Коктейль дня',
      currentSelectedNavBarItem: 0,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 21)),
          SliverPersistentHeader(
            delegate: CategoriesFilterBarDelegate(
              CocktailCategory.values,
              onCategorySelected: (category) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const FilterResultsPageWidget(),
                  ),
                );
              },
            ),
            floating: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          RandomCocktailCard()
        ],
      ),
    );
  }
}

class RandomCocktailCard extends StatelessWidget {
  const RandomCocktailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCubit, RandomState>(
      builder: (context, state) {
        switch (state.status) {
          case RandomStatus.initial:
          case RandomStatus.loading:
            return const RandomLoading();
          case RandomStatus.success:
            final cocktail = state.cocktail!;
            return RandomSuccess(
              cocktail: cocktail,
            );
          case RandomStatus.failure:
            return RandomFailure(exception: state.exception);
        }
      },
    );
  }
}
