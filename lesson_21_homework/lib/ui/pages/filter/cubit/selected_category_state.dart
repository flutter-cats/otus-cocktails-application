part of 'selected_category_cubit.dart';

class SelectedCategoryState extends Equatable {
  const SelectedCategoryState({required this.cocktailCategory});

  final CocktailCategory cocktailCategory;

  SelectedCategoryState copyWith({CocktailCategory? cocktailCategory}) {
    return SelectedCategoryState(
        cocktailCategory: cocktailCategory ?? this.cocktailCategory);
  }

  CocktailCategory get cocktailCat => cocktailCategory;

  @override
  List<Object> get props => [cocktailCategory];
}
