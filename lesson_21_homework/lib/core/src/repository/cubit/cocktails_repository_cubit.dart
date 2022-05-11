import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'cocktails_repository_state.dart';

class CocktailsRepositoryCubit extends Cubit<CocktailsRepositoryState> {
  CocktailsRepositoryCubit(this._cocktailRepository)
      : super(const CocktailsRepositoryState());

  final AsyncCocktailRepository _cocktailRepository;
}
