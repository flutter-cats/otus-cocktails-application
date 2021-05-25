import 'package:cocktails_mobx/app/state/categories/categories_store.dart';
import 'package:mobx/mobx.dart';

import '../../core/models.dart';
import '../../repository/cocktail_repository.dart';
import '../initable.dart';

part 'cocktails_store.g.dart';

class CocktailsStore = _CocktailsStoreBase with _$CocktailsStore;

abstract class _CocktailsStoreBase with Store implements Initable {
  _CocktailsStoreBase(this.cocktailRepository, this._categoriesStore) {
    // Добавляем реакцию: при изменении выбранной категории автоматически запустится загрузка коктейлей
    _disposers.add(
      reaction(
        (_) => _categoriesStore.selectedCategory,
        (_) => loadCocktails(),
      ),
    );
  }

  final CocktailRepository cocktailRepository;
  final CategoriesStore _categoriesStore;
  final _disposers = <ReactionDisposer>[];

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

  // Возвращаемый Future можно использовать в UI: отображать индикатор прогресса.
  // Или же его можно положить в Observable<Future>.
  @action
  Future<void> loadCocktails() async {
    final loadedCocktails =
        await cocktailRepository.fetchCocktailsByCocktailCategory(
            this._categoriesStore.selectedCategory);

    cocktails.clear();
    cocktails.addAll(loadedCocktails);
  }
}
