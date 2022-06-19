import 'package:cocktail_app_tests/app_strings.dart';
import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group('Favourite button test', () {
    Widget buildTestWidget(Widget child) => MaterialApp(
          home: Scaffold(
            body: child,
          ),
        );

    testWidgets('Show filled heart icon when cocktail is favourite',
        (widgetTester) async {
      await mockNetworkImages(() async {
        final Cocktail testCocktail = Cocktail(
          id: '17222',
          name: 'A1',
          drinkThumbUrl:
              'https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg',
          isFavourite: true,
          instruction:
              'Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.',
          category: CocktailCategory.cocktail,
          glassType: GlassType.cocktailGlass,
          cocktailType: CocktailType.alcoholic,
          ingredients: [
            IngredientDefinition('Gin', '1 3/4 shot '),
            IngredientDefinition('Grand Marnier', '1 Shot '),
            IngredientDefinition('Lemon Juice', '1/4 Shot'),
            IngredientDefinition('Grenadine', '1/8 Shot'),
          ],
        );
        await widgetTester.pumpWidget(
          buildTestWidget(
            CocktailDetailPage(
              testCocktail,
            ),
          ),
        );
        final favouriteFinder =
            find.bySemanticsLabel(AppStrings.cocktailIsFavouriteSemantics);
        expect(favouriteFinder, findsOneWidget);
      });
    });

    testWidgets('Show outlined heart icon when cocktail is not favourite',
        (widgetTester) async {
      await mockNetworkImages(() async {
        final Cocktail testCocktail = Cocktail(
          id: '17222',
          name: 'A1',
          drinkThumbUrl:
              'https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg',
          isFavourite: false,
          instruction:
              'Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.',
          category: CocktailCategory.cocktail,
          glassType: GlassType.cocktailGlass,
          cocktailType: CocktailType.alcoholic,
          ingredients: [
            IngredientDefinition('Gin', '1 3/4 shot '),
            IngredientDefinition('Grand Marnier', '1 Shot '),
            IngredientDefinition('Lemon Juice', '1/4 Shot'),
            IngredientDefinition('Grenadine', '1/8 Shot'),
          ],
        );
        await widgetTester.pumpWidget(
          buildTestWidget(
            CocktailDetailPage(
              testCocktail,
            ),
          ),
        );
        final favouriteFinder =
            find.bySemanticsLabel(AppStrings.cocktailIsNotFavouriteSemantics);
        expect(favouriteFinder, findsOneWidget);
      });
    });
  });
}
