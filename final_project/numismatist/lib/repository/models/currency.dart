// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:numismatist/core/const.dart';

part 'currency.g.dart';

@HiveType(typeId: HiveConst.currency)
enum Currency {
  @HiveField(0)
  RUR,
  @HiveField(1)
  USD,
  @HiveField(2)
  EUR
}

class CurrencyConst {
  static Currency parse(num? value) => values.containsKey(value) ? values[value!]! : Currency.RUR;

  static const RURValue = 0;
  static const USDValue = 1;
  static const EURValue = 2;

  static const Map<int, Currency> values = {
    RURValue: Currency.RUR,
    USDValue: Currency.USD,
    EURValue: Currency.EUR,
  };
}

extension SymbolExtension on Currency {
  String toSymbol() => this == Currency.USD
      ? '\$'
      : this == Currency.EUR
          ? '€'
          : this == Currency.RUR
              ? '₽'
              : '';
}
