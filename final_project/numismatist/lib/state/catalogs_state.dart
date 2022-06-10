import 'package:mobx/mobx.dart';
import 'package:numismatist/repository/models/catalog.dart';
import 'package:numismatist/repository/repository.dart';
import 'package:numismatist/state/load_process_state.dart';

part 'catalogs_state.g.dart';

class CatalogsState = CatalogsStateBase with _$CatalogsState;

abstract class CatalogsStateBase with Store {
  final Repository _repository;

  CatalogsStateBase(this._repository) {
    _fillCatalogs();
  }

  @observable
  ObservableList<Catalog> catalogs = ObservableList<Catalog>();

  @observable
  ObservableFuture<int>? _countFuture;

  @observable
  ObservableFuture<void>? _updateFuture;

  @observable
  bool needUpdate = false;

  @observable
  int needUpdateCount = 0;

  @observable
  String errorMessage = '';

  @computed
  LoadProcessState get countState {
    final future = _countFuture;
    if (future == null || future.status == FutureStatus.rejected) {
      return LoadProcessState.initial;
    }
    return future.status == FutureStatus.pending ? LoadProcessState.loading : LoadProcessState.loaded;
  }

  @computed
  LoadProcessState get updateState {
    final future = _updateFuture;
    if (future == null || future.status == FutureStatus.rejected) {
      return LoadProcessState.initial;
    }
    return future.status == FutureStatus.pending ? LoadProcessState.loading : LoadProcessState.loaded;
  }

  @action
  Future<void> checkUpdate() async {
    needUpdate = await _repository.checkUpdate();
  }

  @action
  Future<void> count() async {
    try {
      errorMessage = '';
      _countFuture = ObservableFuture(_repository.getUpdatedCount());
      needUpdateCount = await _countFuture ?? 0;
    } on Error {
      errorMessage = "Ошибка получения списка каталогов";
    }
    await checkUpdate();
  }

  @action
  Future<void> update() async {
    try {
      errorMessage = '';
      _updateFuture = ObservableFuture(_repository.sync());
      await _updateFuture;
    } on Error {
      errorMessage = "Ошибка обновления каталогов";
    }
    _fillCatalogs();
    await checkUpdate();
  }

  void _fillCatalogs() {
    catalogs.clear();
    catalogs.addAll(_repository.getCatalogs());
  }
}
