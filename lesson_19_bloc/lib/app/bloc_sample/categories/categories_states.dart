import 'package:flutter/foundation.dart';
import 'package:lesson_17/app/core/models.dart';

@immutable
class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadInProgress extends CategoriesState {}

class CategoriesLoadSuccess extends CategoriesState {
  CategoriesLoadSuccess({required this.categories, this.selectedCategory});

  final Iterable<CocktailCategory> categories;

  final CocktailCategory? selectedCategory;

  factory CategoriesLoadSuccess.fromMap(Map<String, dynamic> map) {
    return CategoriesLoadSuccess(
      categories: map['categories'] as Iterable<CocktailCategory>,
      selectedCategory: map['selectedCategory'] as CocktailCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categories': this.categories,
      'selectedCategory': this.selectedCategory,
    };
  }

  CategoriesLoadSuccess copyWith({
    Iterable<CocktailCategory>? categories,
    CocktailCategory? selectedCategory,
  }) {
    return CategoriesLoadSuccess(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class CategoriesLoadFailure extends CategoriesState {
  CategoriesLoadFailure(this.errorMessage);

  final String errorMessage;
}
