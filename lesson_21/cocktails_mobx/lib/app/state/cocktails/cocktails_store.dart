import 'package:cocktails_mobx/app/state/categories/categories_store.dart';
import 'package:mobx/mobx.dart';

import '../../core/models.dart';
import '../../repository/cocktail_repository.dart';

part 'cocktails_store.g.dart';

class CocktailsStore = _CocktailsStoreBase with _$CocktailsStore;

abstract class _CocktailsStoreBase with Store {
  static ObservableFuture<Iterable<CocktailDefinition>> emptyResponse =
      ObservableFuture.value([]);

  _CocktailsStoreBase(this._cocktailRepository, this._categoriesStore) {
    // При создании стора - запускаем загрузку коктейлей
    loadCocktails();

    // Добавляем реакцию: при изменении выбранной категории автоматически запустится загрузка коктейлей
    _disposers.add(
      reaction(
        (_) => _categoriesStore.selectedCategory,
        (_) => loadCocktails(),
      ),
    );
  }

  final CocktailRepository _cocktailRepository;
  final CategoriesStore _categoriesStore;
  final _disposers = <ReactionDisposer>[];

  final cocktails = ObservableList<CocktailDefinition>();

  @observable
  ObservableFuture<Iterable<CocktailDefinition>> _cocktailsFuture =
      emptyResponse;

  @computed
  bool get hasResults =>
      _cocktailsFuture != emptyResponse &&
      _cocktailsFuture.status == FutureStatus.fulfilled;

  // Не забыть закрыть реакции
  dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
  }

  @action
  Future<void> loadCocktails() async {
    // Альтернативный вариант: использовать в UI Future, который возвращается этим экшеном
    final future = _cocktailRepository.fetchCocktailsByCocktailCategory(
      this._categoriesStore.selectedCategory,
    );
    _cocktailsFuture = ObservableFuture(future);

    final loadedCocktails = await future;

    cocktails.clear();
    cocktails.addAll(loadedCocktails);
  }
}
