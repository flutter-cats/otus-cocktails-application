import 'package:cocktail_app/uikit/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Fancy button's golden test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: FancyButton(
            title: "Title",
            onTap: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(FancyButton),
      matchesGoldenFile('templates/buttons/fancy_button.png'),
    );
  });
}
