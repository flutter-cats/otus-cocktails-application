import 'package:cocktail_app_tests/ui/pages/details/cocktail_description/cocktail_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@TestOn('vm')

void main() {

  group('CocktailTitle should', () {
    testWidgets('contain icon button with favorite status', (WidgetTester tester) async {
      await tester.pumpWidget(_wrap(CocktailTitle(cocktailTitle: '', isFavorite: true)));

      final titleFinderBySemantic = find.bySemanticsLabel(favoriteStatus);
      expect(titleFinderBySemantic, findsOneWidget);
    });

    testWidgets('contain icon button without favorite status', (WidgetTester tester) async {
      await tester.pumpWidget(_wrap(CocktailTitle(cocktailTitle: '', isFavorite: false)));

      final titleFinderBySemantic = find.bySemanticsLabel(noFavoriteStatus);
      expect(titleFinderBySemantic, findsOneWidget);
    });

  });
}

Widget _wrap(Widget child) => MaterialApp(
  home: Scaffold(body: child),
);