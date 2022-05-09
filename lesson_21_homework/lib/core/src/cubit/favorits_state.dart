part of 'favorits_cubit.dart';

enum FavoritsStatus { initial, loading, success, failure}

extension FavoritsStatusG on FavoritsStatus {
  bool get isInitial => this == FavoritsStatus.initial;
  bool get isLoading => this == FavoritsStatus.loading;
  bool get isSuccess => this == FavoritsStatus.success;
  bool get isFailure => this == FavoritsStatus.failure;
  
}


class FavoritsState extends Equatable {
  const FavoritsState({this.status = FavoritsStatus.initial, 
  this.favoritsList = const [], this.selectedCategory =const  CocktailCategory('init', 'init') , this.selectAll = true, });


final FavoritsStatus status;
final List<Cocktail> favoritsList;
final CocktailCategory selectedCategory;
final bool selectAll;

FavoritsState copyWith ({
  FavoritsStatus? status,
  List<Cocktail>? favoritsList,
  CocktailCategory? selectedCategory,
  bool? selectAll,
}){
  return FavoritsState(
     status: status ?? this.status,
     favoritsList: favoritsList ?? this.favoritsList,
     selectedCategory: selectedCategory ?? this.selectedCategory,
     selectAll: selectAll ?? this.selectAll
  );
}

List<Cocktail> get list => favoritsList;
@override 
  List<Object> get props => [status, favoritsList, selectedCategory, selectAll];
}
