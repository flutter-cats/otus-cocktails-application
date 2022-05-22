import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/src/repository/rating_cocktail_repository.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this._ratingCocktailRepositoryImpl) : super(const RatingState());

  final RatingCocktailRepositoryImpl _ratingCocktailRepositoryImpl;

  void initRatingCocktailCubit() async {
    emit(const RatingState(status: RatingStatus.loading));
    try {
      final Map<int, int> newCocktailsRatingMap =
          await _ratingCocktailRepositoryImpl.initRatingCocktailRepository();
      emit(
        state.copyWith(
          status: RatingStatus.success,
          cocktailsRatingMap: newCocktailsRatingMap,
        ),
      );
    } on Exception catch (exception) {
      emit(
        state.copyWith(
          status: RatingStatus.failure,
          exception: exception,
        ),
      );
    }
  }

  void setRating(int cocktailId, int cocktailRating) {
    Map<int, int> newRatingCocktails = _ratingCocktailRepositoryImpl
        .setCocktailRating(cocktailId, cocktailRating);
    emit(
      state.copyWith(cocktailsRatingMap: newRatingCocktails),
    );
  }

  int getCocktailRating(int id) {
    final int cocktailRating =
        _ratingCocktailRepositoryImpl.getCocktailRatingById(id);
    return cocktailRating;
  }

  void clearRating() {
    _ratingCocktailRepositoryImpl.clearRating();
    emit(state.copyWith(cocktailsRatingMap: {}, status: RatingStatus.success));
  }
}
