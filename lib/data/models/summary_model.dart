import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/summary.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
class SummaryModel with _$SummaryModel {
  const factory SummaryModel({
    @JsonKey(name: 'attendance_today') @Default(0) int attendanceToday,
    @JsonKey(name: 'availability_today') @Default(0) int availabilityToday,
    @JsonKey(name: 'promo_today') @Default(0) int promoToday,
  }) = _SummaryModel;

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);
}

extension SummaryMapper on SummaryModel {
  Summary toEntity({int pendingQueue = 0}) => Summary(
    attendanceToday: attendanceToday,
    availabilityToday: availabilityToday,
    promoToday: promoToday,
    pendingQueue: pendingQueue,
  );
}
