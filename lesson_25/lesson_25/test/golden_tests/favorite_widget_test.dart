import 'package:cocktail_app/uikit/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("FavoriteWidget's golden test", (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(
        AdaptiveFavoriteWidget(
          isFavorite: true,
          color: Colors.red,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(AdaptiveFavoriteWidget),
      matchesGoldenFile('templates/buttons/favorite_widget.png'),
    );
  });
}

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
