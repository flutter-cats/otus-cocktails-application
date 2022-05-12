import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/src/model/cocktail_definition.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(const RatingState(cocktailsRatingList: {}));

  void updateRating(String cocktailId, int rating) {
    emit(
      state.copyWith(
          cocktailsRatingList: {...state.ratingList, cocktailId: rating}),
    );
    print('update performed ____________');
  }
}
