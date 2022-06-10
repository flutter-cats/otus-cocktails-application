import 'package:mobx/mobx.dart';
import 'package:numismatist/repository/models/favorite.dart';
import 'package:numismatist/repository/models/item.dart';
import 'package:numismatist/repository/repository.dart';
import 'package:numismatist/state/load_process_state.dart';

part 'favorites_state.g.dart';

class FavoritesState extends _FavoritesState with _$FavoritesState {
  FavoritesState(Repository repository) : super(repository);
}

abstract class _FavoritesState with Store {
  final Repository _repository;

  _FavoritesState(this._repository) {
    favorites.addAll(_repository.getFavorites());
  }

  @observable
  ObservableList<Favorite> favorites = ObservableList<Favorite>();

  @action
  Future add(Favorite favorite) async {
    favorites.add(favorite);
  }

  @action
  Future remove(Favorite favorite) async {
    favorites.remove(favorite);
  }
}
