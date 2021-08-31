import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_events.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_states.dart';
import 'package:lesson_17/app/bloc_sample/cocktails/cocktails_bloc.dart';
import 'package:lesson_17/app/bloc_sample/cocktails/cocktails_bloc_lib.dart';
import 'package:lesson_17/app/bloc_sample/cocktails/cocktails_states.dart';
import 'package:lesson_17/app/core/models.dart';
import 'package:provider/provider.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import '../cocktails/cocktail_grid_item.dart';
import '../cocktails/cocktails_grid_delegate.dart';
import 'filter_bar_bloc_builder.dart';
import 'fitler_bar.dart';

class CocktailsFilterScreen extends StatelessWidget {
  const CocktailsFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 21)),
            SliverFilterBarBlocBuilder(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            _buildCocktailItems(context)
          ],
        ),
      ),
    );
  }

  // Пример реализации sealed
  Widget _buildCocktailItems(BuildContext context) {
    return SealedBlocBuilder4<CocktailsBlocLib, CocktailsState, CocktailsInitial,
        CocktailsLoadInProgress, CocktailsLoadSuccess, CocktailsLoadFailure>(
      builder: (context, states) => states(
        (initial) => _buildInitialState(),
        (loading) => _buildProgressState(),
        (success) => _buildItems(success.cocktails),
        (failure) => _buildErrorState(failure.errorMessage),
      ),
    );
  }

  Widget _buildInitialState() =>
      SliverToBoxAdapter(child: const SizedBox.shrink());

  Widget _buildItems(Iterable<CocktailDefinition> cocktails) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CocktailGridItem(cocktails.elementAt(index));
            },
            childCount: cocktails.length,
          ),
          gridDelegate: cocktailsGridDelegate),
    );
  }

  Widget _buildErrorState(String error) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(error)),
      );

  Widget _buildProgressState() => const SliverFillRemaining(
      hasScrollBody: false, child: Center(child: CircularProgressIndicator()));
}
