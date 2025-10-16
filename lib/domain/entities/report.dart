import 'package:freezed_annotation/freezed_annotation.dart';
part 'report.freezed.dart';

@freezed
class AttendanceReport with _$AttendanceReport {
  const factory AttendanceReport({
    required int storeId,
    @Default('present') String status,
    DateTime? timestamp,
    double? lat,
    double? lon,
    String? note,
  }) = _AttendanceReport;
}

@freezed
class AvailabilityItem with _$AvailabilityItem {
  const factory AvailabilityItem({
    required int productId,
    required bool available,
    String? barcode,
    String? note,
  }) = _AvailabilityItem;
}

@freezed
class AvailabilityReport with _$AvailabilityReport {
  const factory AvailabilityReport({
    required int storeId,
    required List<AvailabilityItem> items,
    String? clientUuid,
  }) = _AvailabilityReport;
}

@freezed
class PromoReport with _$PromoReport {
  const factory PromoReport({
    required int storeId,
    required String title,
    String? description,
    List<int>? productIds,
    DateTime? startDate,
    DateTime? endDate,
  }) = _PromoReport;
}
