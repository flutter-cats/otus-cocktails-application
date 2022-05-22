import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_21_animations_homework/core/models.dart';

part 'selected_category_state.dart';

class SelectedCategoryCubit extends Cubit<SelectedCategoryState> {
  SelectedCategoryCubit()
      : super(const SelectedCategoryState(
            cocktailCategory: CocktailCategory.ordinaryDrink));

  String selectedCategory() {
    return state.cocktailCategory.value;
  }

  void updateCategory(CocktailCategory cocktailCategory) {
    emit(
      state.copyWith(
        cocktailCategory: cocktailCategory,
      ),
    );
  }
}
