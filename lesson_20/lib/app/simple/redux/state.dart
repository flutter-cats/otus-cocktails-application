import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class SimpleAppState with _$SimpleAppState {
  static const init = SimpleAppState(
    count: 0,
    remainder: 0,
    isFetching: false,
  );

  const factory SimpleAppState({
    required int count,
    required int remainder,
    required bool isFetching,
  }) = _SimpleAppState;
}
