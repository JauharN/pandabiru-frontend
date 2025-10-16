// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) {
  return _SummaryModel.fromJson(json);
}

/// @nodoc
mixin _$SummaryModel {
  @JsonKey(name: 'attendance_today')
  int get attendanceToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'availability_today')
  int get availabilityToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'promo_today')
  int get promoToday => throw _privateConstructorUsedError;

  /// Serializes this SummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryModelCopyWith<SummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryModelCopyWith<$Res> {
  factory $SummaryModelCopyWith(
          SummaryModel value, $Res Function(SummaryModel) then) =
      _$SummaryModelCopyWithImpl<$Res, SummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_today') int attendanceToday,
      @JsonKey(name: 'availability_today') int availabilityToday,
      @JsonKey(name: 'promo_today') int promoToday});
}

/// @nodoc
class _$SummaryModelCopyWithImpl<$Res, $Val extends SummaryModel>
    implements $SummaryModelCopyWith<$Res> {
  _$SummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceToday = null,
    Object? availabilityToday = null,
    Object? promoToday = null,
  }) {
    return _then(_value.copyWith(
      attendanceToday: null == attendanceToday
          ? _value.attendanceToday
          : attendanceToday // ignore: cast_nullable_to_non_nullable
              as int,
      availabilityToday: null == availabilityToday
          ? _value.availabilityToday
          : availabilityToday // ignore: cast_nullable_to_non_nullable
              as int,
      promoToday: null == promoToday
          ? _value.promoToday
          : promoToday // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryModelImplCopyWith<$Res>
    implements $SummaryModelCopyWith<$Res> {
  factory _$$SummaryModelImplCopyWith(
          _$SummaryModelImpl value, $Res Function(_$SummaryModelImpl) then) =
      __$$SummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_today') int attendanceToday,
      @JsonKey(name: 'availability_today') int availabilityToday,
      @JsonKey(name: 'promo_today') int promoToday});
}

/// @nodoc
class __$$SummaryModelImplCopyWithImpl<$Res>
    extends _$SummaryModelCopyWithImpl<$Res, _$SummaryModelImpl>
    implements _$$SummaryModelImplCopyWith<$Res> {
  __$$SummaryModelImplCopyWithImpl(
      _$SummaryModelImpl _value, $Res Function(_$SummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceToday = null,
    Object? availabilityToday = null,
    Object? promoToday = null,
  }) {
    return _then(_$SummaryModelImpl(
      attendanceToday: null == attendanceToday
          ? _value.attendanceToday
          : attendanceToday // ignore: cast_nullable_to_non_nullable
              as int,
      availabilityToday: null == availabilityToday
          ? _value.availabilityToday
          : availabilityToday // ignore: cast_nullable_to_non_nullable
              as int,
      promoToday: null == promoToday
          ? _value.promoToday
          : promoToday // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryModelImpl implements _SummaryModel {
  const _$SummaryModelImpl(
      {@JsonKey(name: 'attendance_today') this.attendanceToday = 0,
      @JsonKey(name: 'availability_today') this.availabilityToday = 0,
      @JsonKey(name: 'promo_today') this.promoToday = 0});

  factory _$SummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryModelImplFromJson(json);

  @override
  @JsonKey(name: 'attendance_today')
  final int attendanceToday;
  @override
  @JsonKey(name: 'availability_today')
  final int availabilityToday;
  @override
  @JsonKey(name: 'promo_today')
  final int promoToday;

  @override
  String toString() {
    return 'SummaryModel(attendanceToday: $attendanceToday, availabilityToday: $availabilityToday, promoToday: $promoToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryModelImpl &&
            (identical(other.attendanceToday, attendanceToday) ||
                other.attendanceToday == attendanceToday) &&
            (identical(other.availabilityToday, availabilityToday) ||
                other.availabilityToday == availabilityToday) &&
            (identical(other.promoToday, promoToday) ||
                other.promoToday == promoToday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, attendanceToday, availabilityToday, promoToday);

  /// Create a copy of SummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryModelImplCopyWith<_$SummaryModelImpl> get copyWith =>
      __$$SummaryModelImplCopyWithImpl<_$SummaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryModelImplToJson(
      this,
    );
  }
}

abstract class _SummaryModel implements SummaryModel {
  const factory _SummaryModel(
      {@JsonKey(name: 'attendance_today') final int attendanceToday,
      @JsonKey(name: 'availability_today') final int availabilityToday,
      @JsonKey(name: 'promo_today') final int promoToday}) = _$SummaryModelImpl;

  factory _SummaryModel.fromJson(Map<String, dynamic> json) =
      _$SummaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'attendance_today')
  int get attendanceToday;
  @override
  @JsonKey(name: 'availability_today')
  int get availabilityToday;
  @override
  @JsonKey(name: 'promo_today')
  int get promoToday;

  /// Create a copy of SummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryModelImplCopyWith<_$SummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
