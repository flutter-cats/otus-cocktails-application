import 'package:cocktail_app_tests/ui/pages/details/cocktail_description/cocktail_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CocktailTitle has a title and isFavorite icon', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: CocktailTitle(
          cocktailTitle: 'Title',
          isFavorite: true,
        ),
      ),
    ));

    final titleFinder = find.text('Title');
    final isFavoriteIcon = find.bySemanticsLabel('isFavorite icon');
    final notIsFavoriteIcon = find.bySemanticsLabel('not isFavorite icon');

    expect(titleFinder, findsOneWidget);
    expect(isFavoriteIcon, findsOneWidget);
    expect(notIsFavoriteIcon, findsNothing);
  });

  testWidgets('CocktailTitle has a title and not isFavorite icon',
      (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: CocktailTitle(
          cocktailTitle: 'Title',
          isFavorite: false,
        ),
      ),
    ));

    final titleFinder = find.text('Title');
    final isFavoriteIcon = find.bySemanticsLabel('isFavorite icon');
    final notIsFavoriteIcon = find.bySemanticsLabel('not isFavorite icon');

    expect(titleFinder, findsOneWidget);
    expect(isFavoriteIcon, findsNothing);
    expect(notIsFavoriteIcon, findsOneWidget);
  });
}
