import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_model.freezed.dart';

@freezed
abstract class ContentViewModel with _$ContentViewModel {
  const factory ContentViewModel({
    required String count,
    required String remainder,
  }) = _ContentViewModel;
}
