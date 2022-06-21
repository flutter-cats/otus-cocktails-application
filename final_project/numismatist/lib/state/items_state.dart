import 'package:mobx/mobx.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/repository/repository.dart';
import 'package:numismatist/state/load_process_state.dart';

part 'items_state.g.dart';

class ItemsState extends _ItemsState with _$ItemsState {
  ItemsState(Repository repository) : super(repository);
}

abstract class _ItemsState with Store {
  final Repository _repository;

  _ItemsState(this._repository);

  @observable
  ObservableFuture<List<Item>>? _itemsFuture;

  @observable
  ObservableList<Item> items = ObservableList<Item>();

  @observable
  String errorMessage = '';

  @computed
  LoadProcessState get state {
    final future = _itemsFuture;
    if (future == null || future.status == FutureStatus.rejected) {
      return LoadProcessState.initial;
    }
    return future.status == FutureStatus.pending ? LoadProcessState.loading : LoadProcessState.loaded;
  }

  @action
  Future getItems(String catalogId) async {
    try {
      _itemsFuture = ObservableFuture(_repository.getItems(catalogId));

      items.clear();
      items.addAll(await _itemsFuture ?? []);
    } on Error {
      items.clear();
      errorMessage = "Ошибка загрузки списка";
    }
  }

  @action
  Future findItems(String searchBy) async {
    try {
      _itemsFuture = ObservableFuture(_repository.findItems(searchBy));

      items.clear();
      items.addAll(await _itemsFuture ?? []);
    } on Error {
      items.clear();
      errorMessage = "Ошибка загрузки списка";
    }
  }
}
