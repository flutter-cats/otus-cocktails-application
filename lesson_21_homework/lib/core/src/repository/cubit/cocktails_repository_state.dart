part of 'cocktails_repository_cubit.dart';

enum CocktailsRepositoryStatus { initial, loading, success, failure }

class CocktailsRepositoryState extends Equatable {
  const CocktailsRepositoryState(
      {this.status = CocktailsRepositoryStatus.initial});

  final CocktailsRepositoryStatus status;

  @override
  List<Object> get props => [];
}
