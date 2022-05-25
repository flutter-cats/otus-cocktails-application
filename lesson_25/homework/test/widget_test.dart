import 'package:cocktail_app_tests/ui/pages/details/cocktail_description/cocktail_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('CocktailTitle should', () {

    testWidgets('should find title and favourite icon', (tester) async {
      await tester.pumpWidget(wrapTitleWidget(CocktailTitle(cocktailTitle: 'TITLE', isFavorite: true)));
      final titleFinder = find.text('TITLE');
      final favouriteFinder = find.bySemanticsLabel('favourite');
      expect(titleFinder, findsOneWidget);
      expect(favouriteFinder, findsOneWidget);
    });

    testWidgets('should find title and no favourite icon', (tester) async {
      await tester.pumpWidget(wrapTitleWidget(CocktailTitle(cocktailTitle: 'Another Title', isFavorite: false)));
      final titleFinder = find.text('Another Title');
      final favouriteFinder = find.bySemanticsLabel('no favourite');
      expect(titleFinder, findsOneWidget);
      expect(favouriteFinder, findsOneWidget);
    });
  });
}

Widget wrapTitleWidget(Widget child) => MaterialApp(
  home: Scaffold(body: child),
);