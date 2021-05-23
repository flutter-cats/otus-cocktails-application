import 'package:cocktails_mobx/app/state/categories/categories_store.dart';
import 'package:mobx/mobx.dart';

import '../../core/models.dart';
import '../../repository/cocktail_repository.dart';
import '../initable.dart';

part 'cocktails_store.g.dart';

class CocktailsStore = _CocktailsStoreBase with _$CocktailsStore;

abstract class _CocktailsStoreBase with Store implements Initable {
  _CocktailsStoreBase(this.cocktailRepository, this.categoriesStore) {
    // Добавляем реакцию: при изменении выбранной категории запускаем загрузку коктейлей
    _disposers.add(
      reaction(
        (_) => categoriesStore.selectedCategory,
        (_) => loadCocktails(),
      ),
    );
  }

  final CocktailRepository cocktailRepository;
  final CategoriesStore categoriesStore;
  final _disposers = <ReactionDisposer>[];

  // comment
  final cocktails = ObservableList<CocktailDefinition>();

  @override
  Future<void> init() {
    return loadCocktails();
  }

  dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }

  //todo result, error handling
  @action
  Future<void> loadCocktails() async {
    final loadedCocktails =
        await cocktailRepository.fetchCocktailsByCocktailCategory(
            this.categoriesStore.selectedCategory);

    cocktails.clear();
    cocktails.addAll(loadedCocktails);
  }
}
