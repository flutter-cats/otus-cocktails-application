import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_bloc.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_events.dart';
import 'package:lesson_17/app/bloc_sample/categories/categories_states.dart';
import 'package:lesson_17/app/ui/style/colors.dart';

import 'fitler_bar.dart';

class SliverFilterBarBlocBuilder
    extends BlocBuilder<CategoriesBloc, CategoriesState> {
  SliverFilterBarBlocBuilder(
      {Key? key,
      CategoriesBloc? bloc,
      BlocBuilderCondition<CategoriesState>? buildWhen})
      : super(
          key: key,
          bloc: bloc,
          buildWhen: buildWhen,
          builder: (context, state) {
            if (state is CategoriesLoadSuccess) {
              return SliverPersistentHeader(
                floating: true,
                delegate: CategoriesFilterBarDelegate(
                  state.categories,
                  onCategorySelected: (category) {
                    context
                        .read<CategoriesBloc>()
                        .add(CategoriesCategorySelected(category));
                  },
                  selectedCategory: state.selectedCategory,
                ),
              );
            }

            if (state is CategoriesLoadFailure) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: 48,
                  child: Center(
                    child: Text(state.errorMessage),
                  ),
                ),
              );
            }

            if (state is CategoriesLoadInProgress) {
              return SliverToBoxAdapter(
                child: SizedBox(
                    height: 48,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        );
}
