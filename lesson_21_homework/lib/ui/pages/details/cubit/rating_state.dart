part of 'rating_cubit.dart';

class RatingState extends Equatable {
  const RatingState({required this.cocktailsRatingList});

  final Map<String, int> cocktailsRatingList;

  RatingState copyWith({Map<String, int>? cocktailsRatingList}) {
    return RatingState(
        cocktailsRatingList: cocktailsRatingList ?? this.cocktailsRatingList);
  }

  @override
  List<Object> get props => [cocktailsRatingList];
}
