import 'package:cocktail_app_tests/core/models.dart';

import 'package:test/test.dart';



 void main() async {
   final rep = AsyncCocktailRepository();
   final  cocktail = await rep.getRandomCocktail();
   
   

 group('Cocktail should', ()  {
   test(' have not null id', () {
    expect(cocktail is Cocktail && cocktail.id != null  , true);
  }, );
   
    Future<bool> _cocktailDetails () async {
       final  cD = await rep.fetchCocktailDetails(cocktail!.id!);
          return (cD is Cocktail && cD.category != null && cD.cocktailType !=null &&
        cD.glassType != null && cD.ingredients !=null && cD.instruction != null 
        && cD.drinkThumbUrl != null);
        }

    test('have not null details', () async { 
        expect( await _cocktailDetails(), true );
    });

     Future<bool> _cocktailCategory() async {
       return  await rep.fetchCocktailsByCocktailCategory(cocktail!.category!).then((value) => value.isNotEmpty);
     }
     
    test('have not zero length category list', () async { 
        expect(await _cocktailCategory(), true );
    });

    Future<bool> _cocktailType() async {
       return  await rep.fetchCocktailsByCocktailType(cocktail!.cocktailType!).then((value) => value.isNotEmpty);
     }

    test('have not zero length cocktail type list', () async { 
        expect(await _cocktailType(), true );
    });
   
 }); 

 final  popularCocktails = await rep.fetchPopularCocktails();
  
  test('List of Popular Cocktails is not empty', ()  {
       expect(popularCocktails.isNotEmpty  , true);
  });
 
  
}