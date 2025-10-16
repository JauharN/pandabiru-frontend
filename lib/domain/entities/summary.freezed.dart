// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Summary {
  int get attendanceToday => throw _privateConstructorUsedError;
  int get availabilityToday => throw _privateConstructorUsedError;
  int get promoToday => throw _privateConstructorUsedError;
  int get pendingQueue => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call({
    int attendanceToday,
    int availabilityToday,
    int promoToday,
    int pendingQueue,
  });
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceToday = null,
    Object? availabilityToday = null,
    Object? promoToday = null,
    Object? pendingQueue = null,
  }) {
    return _then(
      _value.copyWith(
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
            pendingQueue: null == pendingQueue
                ? _value.pendingQueue
                : pendingQueue // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
    _$SummaryImpl value,
    $Res Function(_$SummaryImpl) then,
  ) = __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int attendanceToday,
    int availabilityToday,
    int promoToday,
    int pendingQueue,
  });
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
    _$SummaryImpl _value,
    $Res Function(_$SummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceToday = null,
    Object? availabilityToday = null,
    Object? promoToday = null,
    Object? pendingQueue = null,
  }) {
    return _then(
      _$SummaryImpl(
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
        pendingQueue: null == pendingQueue
            ? _value.pendingQueue
            : pendingQueue // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SummaryImpl implements _Summary {
  const _$SummaryImpl({
    this.attendanceToday = 0,
    this.availabilityToday = 0,
    this.promoToday = 0,
    this.pendingQueue = 0,
  });

  @override
  @JsonKey()
  final int attendanceToday;
  @override
  @JsonKey()
  final int availabilityToday;
  @override
  @JsonKey()
  final int promoToday;
  @override
  @JsonKey()
  final int pendingQueue;

  @override
  String toString() {
    return 'Summary(attendanceToday: $attendanceToday, availabilityToday: $availabilityToday, promoToday: $promoToday, pendingQueue: $pendingQueue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.attendanceToday, attendanceToday) ||
                other.attendanceToday == attendanceToday) &&
            (identical(other.availabilityToday, availabilityToday) ||
                other.availabilityToday == availabilityToday) &&
            (identical(other.promoToday, promoToday) ||
                other.promoToday == promoToday) &&
            (identical(other.pendingQueue, pendingQueue) ||
                other.pendingQueue == pendingQueue));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    attendanceToday,
    availabilityToday,
    promoToday,
    pendingQueue,
  );

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);
}

abstract class _Summary implements Summary {
  const factory _Summary({
    final int attendanceToday,
    final int availabilityToday,
    final int promoToday,
    final int pendingQueue,
  }) = _$SummaryImpl;

  @override
  int get attendanceToday;
  @override
  int get availabilityToday;
  @override
  int get promoToday;
  @override
  int get pendingQueue;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
