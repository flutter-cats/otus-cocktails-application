import 'dart:io';

import 'package:cocktail_app_tests/core/models.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_description/cocktail_description_widget.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_description/cocktail_title.dart';
import 'package:cocktail_app_tests/ui/pages/details/cocktail_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() async {
  group('tests', () {
    final mockCocktail = FakeCocktail();

    setUpAll(() => HttpOverrides.global = null);

    testWidgets('favourite false is bordered', (tester) async {
      await tester.pumpWidget(_wrap(CocktailTitle(
        cocktailTitle: '',
        isFavorite: false,
      )));
      await tester.pumpAndSettle(Duration(seconds: 2));

      expect(find.byIcon(Icons.favorite), findsNothing);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });

    testWidgets('favourite true is fulfilled', (tester) async {
      await tester.pumpWidget(_wrap(CocktailTitle(
        cocktailTitle: '',
        isFavorite: true,
      )));
      await tester.pumpAndSettle(Duration(seconds: 2));

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets('favourite default false', (tester) async {
      await tester.pumpWidget(_wrap(CocktailDetailPage(mockCocktail)));
      await tester.pumpAndSettle(Duration(seconds: 2));

      expect(await find.byIcon(Icons.favorite), findsNothing);
      expect(await find.byIcon(Icons.favorite_border), findsOneWidget);
    });
  });
}

class FakeCocktail with Fake implements Cocktail {
  @override
  String? get name => 'meow';

  @override
  String? get drinkThumbUrl =>
      'https://turboportal.net/uploads/posts/2018-03/1521537581554.jpg';

  @override
  Iterable<IngredientDefinition>? get ingredients => Iterable.empty();

  @override
  String? get instruction => 'instruction';

  @override
  GlassType? get glassType => GlassType.beerMug;

  @override
  bool? get isFavourite => false;

  @override
  String? get id => 'test_id';

  @override
  CocktailCategory? get category => CocktailCategory.beer;

  @override
  CocktailType? get cocktailType => CocktailType.alcoholic;
}

Widget _wrap(Widget widget) {
  return MaterialApp(home: Scaffold(body: widget));
}
