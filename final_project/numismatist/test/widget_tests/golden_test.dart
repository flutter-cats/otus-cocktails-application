import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:numismatist/main.dart';
import 'package:numismatist/ui/component/coin_progress_indicator.dart';

/*
flutter test --update-goldens test/widget_tests/golden_test.dart
*/
void main() {
  Widget createWidget() {
    return const Center(
      child: RepaintBoundary(child: CoinProgressIndicator()),
    );
  }

  Widget createSizedWidget() {
    return const Center(
      child: RepaintBoundary(child: CoinProgressIndicator(size: 150)),
    );
  }

  Widget createColoredWidget() {
    return const Center(
      child: RepaintBoundary(child: CoinProgressIndicator(color: Colors.red)),
    );
  }

  group('CoinProgressIndicator should', () {
    testWidgets('contain some widgets', (WidgetTester tester) async {
      await tester.pumpWidget(_wrap(const CoinProgressIndicator()));

      expect(find.byType(CoinProgressIndicator), findsOneWidget);
      expect(find.descendant(of: find.byType(CoinProgressIndicator), matching: find.byType(CustomPaint)), findsOneWidget);

      final box = find.byType(SizedBox);
      expect(box, findsOneWidget);
    });

    testWidgets('matches defaultCoinProgressIndicatorImage goldenfile test', (WidgetTester tester) async {
      Widget widget = createWidget();
      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(CoinProgressIndicator),
        matchesGoldenFile('golden/defaultCoinProgressIndicatorImage.png'),
        skip: !Platform.isWindows,
      );
    });

    testWidgets('matches sizedCoinProgressIndicatorImage goldenfile test', (WidgetTester tester) async {
      Widget widget = createSizedWidget();
      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(CoinProgressIndicator),
        matchesGoldenFile('golden/sizedCoinProgressIndicatorImage.png'),
        skip: !Platform.isWindows,
      );
    });

    testWidgets('matches coloredCoinProgressIndicatorImage goldenfile test', (WidgetTester tester) async {
      Widget widget = createColoredWidget();
      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(CoinProgressIndicator),
        matchesGoldenFile('golden/coloredCoinProgressIndicatorImage.png'),
        skip: !Platform.isWindows,
      );
    });
  });
}

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(body: child),
    );
