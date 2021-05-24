import 'package:flutter_test/flutter_test.dart';

import 'package:cocktail_db_http_using/cocktail_db_http_using.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
