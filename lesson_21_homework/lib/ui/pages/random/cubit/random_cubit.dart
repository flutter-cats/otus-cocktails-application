import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit(this._remoteCocktailRepositoryImpl) : super(const RandomState());

  final RemoteCocktailRepositoryImpl _remoteCocktailRepositoryImpl;

  Future<void> fetchRandomCocktail() async {
    emit(state.copyWith(status: RandomStatus.loading));
    try {
      final cocktail = await _remoteCocktailRepositoryImpl.getRandomCocktail();
      emit(
        state.copyWith(status: RandomStatus.success, cocktail: cocktail),
      );
    } on Exception catch (exception) {
      emit(
        state.copyWith(status: RandomStatus.failure, exception: exception),
      );
    }
  }
}
