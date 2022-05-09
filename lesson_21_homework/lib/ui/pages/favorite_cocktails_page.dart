import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_21_animations_homework/core/src/cubit/favorits_cubit.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:flutter/material.dart';

import '../../core/models.dart';
import 'categories_fitler_bar_delegate.dart';
import 'cocktail_grid_item.dart';


class FavouriteCocktailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
        title: 'Избранное',
        currentSelectedNavBarItem: 2,
        child: BlocBuilder<FavoritsCubit, FavoritsState>(
          
          builder: (context, state) {
            
            return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 21)),
                    
                       SliverPersistentHeader(
                          delegate: CategoriesFilterBarDelegate(
                            CocktailCategory.values,
                            onCategorySelected: (category) {
                              BlocProvider.of<FavoritsCubit>(context).changeSelectedCategory(category);
                            },
                            selectedCategory: (state.selectAll) ? null : state.selectedCategory,
                          ),
                          floating: true,
                        ),
                     
                    SliverToBoxAdapter(child: SizedBox(height: 24)),
                    BuildCocktailItems(state: state,),
                    
                  ],
                );
          },
        ));
  }


}
class BuildCocktailItems extends StatelessWidget {
     const BuildCocktailItems({ Key? key, required this.state }) : super(key: key);
     final FavoritsState state;
     @override
     Widget build(BuildContext context) {
       
           if (state.status.isFailure) {
             return SliverFillRemaining(
              child: Center(
                child: Text(
                  "An error occurred while accessing the favorites repository",
                ),
              ),
            );
           } else if (state.status.isSuccess ) {
             List<Cocktail> _list = (state.selectAll) ? state.list : 
             state.list.where((e) => (e.category?.value ?? CocktailCategory.unknown) == state.selectedCategory.value).toList();
             return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  return CocktailGridItem(
                     _list[index],
                    selectedCategory: _list[index].category ?? CocktailCategory.unknown,
                  );
                }, childCount: _list.length,
                  ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: CocktailGridItem.aspectRatio,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                ),
              ),
            );
           } else {
             return SliverFillRemaining(
              child: Center(
              child: const CircularProgressIndicator(),
            ),
          );
           }
         }
       
     
   }