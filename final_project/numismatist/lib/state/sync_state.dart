import 'package:mobx/mobx.dart';
import 'package:numismatist/repository/repository.dart';

import 'package:provider/provider.dart';

part 'sync_state.g.dart';

class SyncState = SyncStateBase with _$SyncState;

enum SyncProcessState { initial, loading, loaded }

abstract class SyncStateBase with Store {
  final Repository _repository;

  SyncStateBase(this._repository);

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
  SyncProcessState get countState {
    final future = _countFuture;
    if (future == null || future.status == FutureStatus.rejected) {
      return SyncProcessState.initial;
    }
    return future.status == FutureStatus.pending ? SyncProcessState.loading : SyncProcessState.loaded;
  }

  @computed
  SyncProcessState get updateState {
    final future = _updateFuture;
    if (future == null || future.status == FutureStatus.rejected) {
      return SyncProcessState.initial;
    }
    return future.status == FutureStatus.pending ? SyncProcessState.loading : SyncProcessState.loaded;
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
    await checkUpdate();
  }
}
