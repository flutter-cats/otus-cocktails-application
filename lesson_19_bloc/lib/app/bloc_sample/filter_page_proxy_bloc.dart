import 'package:lesson_17/app/bloc_sample/categories/categories_events.dart';
import 'package:lesson_17/app/bloc_sample/cocktails/cocktails_events.dart';
import 'package:lesson_17/app/core/models.dart';

import 'categories/categories_bloc.dart';
import 'cocktails/cocktails_bloc_lib.dart';

// Пример как можно соединять несколько bloc через proxy
class FilterPageBlocProxy {
  FilterPageBlocProxy(this.categoriesBloc, this.cocktailsBloc);

  final CategoriesBloc categoriesBloc;

  final CocktailsBlocLib cocktailsBloc;

  void selectCategory(CocktailCategory category) {
    categoriesBloc.add(CategoriesCategorySelected(category));
    cocktailsBloc.add(CocktailsFetched(category));
  }

  void dispose() {
    categoriesBloc.close();
    cocktailsBloc.close();
  }
}
