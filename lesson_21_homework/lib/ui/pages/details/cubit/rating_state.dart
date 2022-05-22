part of 'rating_cubit.dart';

enum RatingStatus { initial, loading, success, failure }

class RatingState extends Equatable {
  const RatingState({
    this.status = RatingStatus.initial,
    this.cocktailsRatingMap = const {},
    this.exception,
  });

  final Map<int, int> cocktailsRatingMap;
  final RatingStatus status;
  final Exception? exception;

  RatingState copyWith(
      {Map<int, int>? cocktailsRatingMap,
      RatingStatus? status,
      Exception? exception}) {
    return RatingState(
        cocktailsRatingMap: cocktailsRatingMap ?? this.cocktailsRatingMap,
        status: status ?? this.status,
        exception: exception);
  }

  @override
  List<Object> get props => [cocktailsRatingMap, status];
}
