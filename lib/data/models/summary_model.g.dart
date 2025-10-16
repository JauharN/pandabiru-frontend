// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryModelImpl _$$SummaryModelImplFromJson(Map<String, dynamic> json) =>
    _$SummaryModelImpl(
      attendanceToday: (json['attendance_today'] as num?)?.toInt() ?? 0,
      availabilityToday: (json['availability_today'] as num?)?.toInt() ?? 0,
      promoToday: (json['promo_today'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SummaryModelImplToJson(_$SummaryModelImpl instance) =>
    <String, dynamic>{
      'attendance_today': instance.attendanceToday,
      'availability_today': instance.availabilityToday,
      'promo_today': instance.promoToday,
    };
