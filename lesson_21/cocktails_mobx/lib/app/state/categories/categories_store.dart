import 'package:mobx/mobx.dart';

import '../../core/models.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  _CategoriesStoreBase();

  final categories = ObservableList.of(CocktailCategory.values);

  late final Observable<CocktailCategory> _selectedCategory =
      Observable<CocktailCategory>(categories.first);

  // Можно создавать геттер над Observable для упрощения доступа
  CocktailCategory get selectedCategory => _selectedCategory.value;

  @action
  void selectCategory(CocktailCategory category) {
    _selectedCategory.value = category;
  }
}
