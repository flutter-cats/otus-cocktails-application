import 'package:homework/adapters.dart';
import 'package:homework/mocks.dart';

void main(){
	var cocktail = adaptCoctail(
		json: mockCocktail,
		lang: 'en',
	);

	print(cocktail);
	print('--------------------------------------------------------');
	print('cocktail.lang: ${cocktail.lang}');
	print('cocktail.id: ${cocktail.id}');
	print('cocktail.name: ${cocktail.name}');
	print('cocktail.dateModified: ${cocktail.dateModified}');
	print('cocktail.instructions ${cocktail.instructions}');
	print('cocktail.glass: ${cocktail.glass}');
	print('cocktail.thumbUrl: ${cocktail.thumbUrl}');
	print('cocktail.videoUrl: ${cocktail.videoUrl}');
	print('cocktail.ingradients:');
	for(var ingredient in cocktail.ingredients) {
		print('-- ingradient:');
		print('---- ingradient.measure: ${ingredient.measure}');
		print('---- ingradient.ingredient: ${ingredient.ingredient}');
	}

	print('--------------------------------------------------------');
	cocktail.lang = 'de';
	print('cocktail.lang: ${cocktail.lang}');
	print('cocktail.id: ${cocktail.id}');
	print('cocktail.name: ${cocktail.name}');
	print('cocktail.dateModified: ${cocktail.dateModified}');
	print('cocktail.instructions ${cocktail.instructions}');
	print('cocktail.glass: ${cocktail.glass}');
	print('cocktail.thumbUrl: ${cocktail.thumbUrl}');
	print('cocktail.videoUrl: ${cocktail.videoUrl}');
	print('cocktail.ingradients:');
	for(var ingredient in cocktail.ingredients) {
		print('-- ingradient:');
		print('---- ingradient.measure: ${ingredient.measure}');
		print('---- ingradient.ingredient: ${ingredient.ingredient}');
	}
}
