part of 'random_cubit.dart';

enum RandomStatus { initial, loading, success, failure }

extension RandomStatusX on RandomStatus {
  bool get isInitial => this == RandomStatus.initial;

  bool get isLoading => this == RandomStatus.loading;

  bool get isSuccess => this == RandomStatus.success;

  bool get isFailure => this == RandomStatus.failure;
}

class RandomState extends Equatable {
  const RandomState(
      {this.cocktail, this.exception, this.status = RandomStatus.initial});

  final RandomStatus status;
  final Cocktail? cocktail;
  final Exception? exception;

  RandomState copyWith(
      {Cocktail? cocktail, RandomStatus? status, Exception? exception}) {
    return RandomState(
        cocktail: cocktail ?? this.cocktail,
        status: status ?? this.status,
        exception: exception);
  }

  @override
  List<Object?> get props => [status, cocktail, exception];
}
