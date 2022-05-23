@TestOn('vm')
import 'dart:io';

import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/application_semantics.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  final Cocktail cocktailFavorite = Cocktail(
    id: '14029',
    category: CocktailCategory.cocktail,
    cocktailType: CocktailType.alcoholic,
    glassType: GlassType.highballGlass,
    instruction: '''
                      1. Fill a rocks glass with ice 2.add white creme de cacao and vodka 3.stir
                    ''',
    isFavourite: true,
    name: '\'57 Chevy with a White License Plate',
    ingredients: [
      IngredientDefinition('Creme de Cacao', '1 oz white '),
      IngredientDefinition('Vodka', '1 oz '),
    ],
    drinkThumbUrl: 'https://www.thecocktaildb.com/images/media/drink/qyyvtu1468878544.jpg',
  );

  final Cocktail cocktailNotFavorite = Cocktail(
    id: '15395',
    category: CocktailCategory.shot,
    cocktailType: CocktailType.alcoholic,
    glassType: GlassType.oldFashionedGlass,
    instruction: '''
                      Shake ingredients in a mixing tin filled with ice cubes. Strain into a rocks glass.
                    ''',
    isFavourite: false,
    name: '1-900-FUK-MEUP',
    ingredients: [
      IngredientDefinition('Absolut Kurant', '1/2 oz '),
      IngredientDefinition('Grand Marnier', '1/4 oz '),
      IngredientDefinition('Chambord raspberry liqueur', '1/4 oz '),
      IngredientDefinition('Midori melon liqueur', '1/4 oz '),
      IngredientDefinition('Malibu rum', '1/4 oz '),
      IngredientDefinition('Amaretto', '1/4 oz '),
      IngredientDefinition('Cranberry juice', '1/2 oz '),
      IngredientDefinition('Pineapple juice', '1/4 oz '),
    ],
    drinkThumbUrl: 'https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg',
  );

  setUpAll(() => HttpOverrides.global = null);

  group('Cocktail Details page should', () {
    testWidgets('contain button with favorite icon for cocktail from favorites', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(_wrap(CocktailDetailPage(cocktailFavorite)));
        await tester.pumpAndSettle();
        tester.ensureSemantics();

        final isFavoriteFinderBySemantic = find.bySemanticsLabel(ApplicationSemantics.cocktailIsNotFavoriteButton);
        expect(isFavoriteFinderBySemantic, findsOneWidget);

        final isNotFavoriteFinderBySemantic = find.bySemanticsLabel(ApplicationSemantics.cocktailIsFavoriteButton);
        expect(isNotFavoriteFinderBySemantic, findsNothing);
      });
    });

    testWidgets('contain button with not favorite icon if cocktail is not favorite', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(_wrap(CocktailDetailPage(cocktailFavorite)));
        await tester.pumpAndSettle();
        tester.ensureSemantics();

        final favoriteFinderBySemantic = find.bySemanticsLabel(ApplicationSemantics.cocktailIsNotFavoriteButton);
        expect(favoriteFinderBySemantic, findsOneWidget);
      });
    });
  });
}

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(body: child),
    );
