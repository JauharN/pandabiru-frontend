import 'package:freezed_annotation/freezed_annotation.dart';
part 'summary.freezed.dart';

@freezed
class Summary with _$Summary {
  const factory Summary({
    @Default(0) int attendanceToday,
    @Default(0) int availabilityToday,
    @Default(0) int promoToday,
    @Default(0) int pendingQueue,
  }) = _Summary;
}
