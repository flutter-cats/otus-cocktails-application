

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'favorits_state.dart';

class FavoritsCubit extends Cubit<FavoritsState> {
  FavoritsCubit() : super(FavoritsState());

final box = Hive.box<Cocktail>('favorits');

Future<void> fetchFavorits() async{  
   emit(state.copyWith(status: FavoritsStatus.loading));
   try {
     
     Future.delayed(Duration(seconds: 5)).then((value) { 
       List<Cocktail> _favoritsList = box.toMap().values.toList();
       emit(state.copyWith(status: FavoritsStatus.success, favoritsList: _favoritsList));});
     
     
   } catch (e) {
     emit(state.copyWith(status: FavoritsStatus.failure));
   }
}

void addOrRemoveFavorit(Cocktail cocktail){
  
  cocktail.isFavourite = !cocktail.isFavourite;
  List<Cocktail>  _favoritsList = List.from(state.list);
  Cocktail _cocktail = Cocktail(
    isFavourite: cocktail.isFavourite,
    id: cocktail.id,
    name: cocktail.name,
    drinkThumbUrl: cocktail.drinkThumbUrl,
    category: cocktail.category
  );
  if (_cocktail.isFavourite){
  _favoritsList.add(_cocktail);
   box.put(_cocktail.id, _cocktail);}
   else {
    _favoritsList.removeWhere((e) => e.id == _cocktail.id);
    box.delete(_cocktail.id);
   }
  emit(state.copyWith(favoritsList: _favoritsList, ));
   
}

void changeSelectedCategory(CocktailCategory selectedCategory){
   if (selectedCategory == state.selectedCategory && !state.selectAll){
      emit(state.copyWith(selectAll: true));
   } else {
      emit(state.copyWith(selectAll: false, selectedCategory: selectedCategory));
   }
}

}
