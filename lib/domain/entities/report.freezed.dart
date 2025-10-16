// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AttendanceReport {
  int get storeId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceReportCopyWith<AttendanceReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceReportCopyWith<$Res> {
  factory $AttendanceReportCopyWith(
    AttendanceReport value,
    $Res Function(AttendanceReport) then,
  ) = _$AttendanceReportCopyWithImpl<$Res, AttendanceReport>;
  @useResult
  $Res call({
    int storeId,
    String status,
    DateTime? timestamp,
    double? lat,
    double? lon,
    String? note,
  });
}

/// @nodoc
class _$AttendanceReportCopyWithImpl<$Res, $Val extends AttendanceReport>
    implements $AttendanceReportCopyWith<$Res> {
  _$AttendanceReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? status = null,
    Object? timestamp = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            storeId: null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lat: freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double?,
            lon: freezed == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                      as double?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttendanceReportImplCopyWith<$Res>
    implements $AttendanceReportCopyWith<$Res> {
  factory _$$AttendanceReportImplCopyWith(
    _$AttendanceReportImpl value,
    $Res Function(_$AttendanceReportImpl) then,
  ) = __$$AttendanceReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int storeId,
    String status,
    DateTime? timestamp,
    double? lat,
    double? lon,
    String? note,
  });
}

/// @nodoc
class __$$AttendanceReportImplCopyWithImpl<$Res>
    extends _$AttendanceReportCopyWithImpl<$Res, _$AttendanceReportImpl>
    implements _$$AttendanceReportImplCopyWith<$Res> {
  __$$AttendanceReportImplCopyWithImpl(
    _$AttendanceReportImpl _value,
    $Res Function(_$AttendanceReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttendanceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? status = null,
    Object? timestamp = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$AttendanceReportImpl(
        storeId: null == storeId
            ? _value.storeId
            : storeId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lat: freezed == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double?,
        lon: freezed == lon
            ? _value.lon
            : lon // ignore: cast_nullable_to_non_nullable
                  as double?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AttendanceReportImpl implements _AttendanceReport {
  const _$AttendanceReportImpl({
    required this.storeId,
    this.status = 'present',
    this.timestamp,
    this.lat,
    this.lon,
    this.note,
  });

  @override
  final int storeId;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? timestamp;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String? note;

  @override
  String toString() {
    return 'AttendanceReport(storeId: $storeId, status: $status, timestamp: $timestamp, lat: $lat, lon: $lon, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceReportImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, storeId, status, timestamp, lat, lon, note);

  /// Create a copy of AttendanceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceReportImplCopyWith<_$AttendanceReportImpl> get copyWith =>
      __$$AttendanceReportImplCopyWithImpl<_$AttendanceReportImpl>(
        this,
        _$identity,
      );
}

abstract class _AttendanceReport implements AttendanceReport {
  const factory _AttendanceReport({
    required final int storeId,
    final String status,
    final DateTime? timestamp,
    final double? lat,
    final double? lon,
    final String? note,
  }) = _$AttendanceReportImpl;

  @override
  int get storeId;
  @override
  String get status;
  @override
  DateTime? get timestamp;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  String? get note;

  /// Create a copy of AttendanceReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceReportImplCopyWith<_$AttendanceReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AvailabilityItem {
  int get productId => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityItemCopyWith<AvailabilityItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityItemCopyWith<$Res> {
  factory $AvailabilityItemCopyWith(
    AvailabilityItem value,
    $Res Function(AvailabilityItem) then,
  ) = _$AvailabilityItemCopyWithImpl<$Res, AvailabilityItem>;
  @useResult
  $Res call({int productId, bool available, String? barcode, String? note});
}

/// @nodoc
class _$AvailabilityItemCopyWithImpl<$Res, $Val extends AvailabilityItem>
    implements $AvailabilityItemCopyWith<$Res> {
  _$AvailabilityItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? available = null,
    Object? barcode = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int,
            available: null == available
                ? _value.available
                : available // ignore: cast_nullable_to_non_nullable
                      as bool,
            barcode: freezed == barcode
                ? _value.barcode
                : barcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailabilityItemImplCopyWith<$Res>
    implements $AvailabilityItemCopyWith<$Res> {
  factory _$$AvailabilityItemImplCopyWith(
    _$AvailabilityItemImpl value,
    $Res Function(_$AvailabilityItemImpl) then,
  ) = __$$AvailabilityItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, bool available, String? barcode, String? note});
}

/// @nodoc
class __$$AvailabilityItemImplCopyWithImpl<$Res>
    extends _$AvailabilityItemCopyWithImpl<$Res, _$AvailabilityItemImpl>
    implements _$$AvailabilityItemImplCopyWith<$Res> {
  __$$AvailabilityItemImplCopyWithImpl(
    _$AvailabilityItemImpl _value,
    $Res Function(_$AvailabilityItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailabilityItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? available = null,
    Object? barcode = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$AvailabilityItemImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        available: null == available
            ? _value.available
            : available // ignore: cast_nullable_to_non_nullable
                  as bool,
        barcode: freezed == barcode
            ? _value.barcode
            : barcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AvailabilityItemImpl implements _AvailabilityItem {
  const _$AvailabilityItemImpl({
    required this.productId,
    required this.available,
    this.barcode,
    this.note,
  });

  @override
  final int productId;
  @override
  final bool available;
  @override
  final String? barcode;
  @override
  final String? note;

  @override
  String toString() {
    return 'AvailabilityItem(productId: $productId, available: $available, barcode: $barcode, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, available, barcode, note);

  /// Create a copy of AvailabilityItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityItemImplCopyWith<_$AvailabilityItemImpl> get copyWith =>
      __$$AvailabilityItemImplCopyWithImpl<_$AvailabilityItemImpl>(
        this,
        _$identity,
      );
}

abstract class _AvailabilityItem implements AvailabilityItem {
  const factory _AvailabilityItem({
    required final int productId,
    required final bool available,
    final String? barcode,
    final String? note,
  }) = _$AvailabilityItemImpl;

  @override
  int get productId;
  @override
  bool get available;
  @override
  String? get barcode;
  @override
  String? get note;

  /// Create a copy of AvailabilityItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityItemImplCopyWith<_$AvailabilityItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AvailabilityReport {
  int get storeId => throw _privateConstructorUsedError;
  List<AvailabilityItem> get items => throw _privateConstructorUsedError;
  String? get clientUuid => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityReportCopyWith<AvailabilityReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityReportCopyWith<$Res> {
  factory $AvailabilityReportCopyWith(
    AvailabilityReport value,
    $Res Function(AvailabilityReport) then,
  ) = _$AvailabilityReportCopyWithImpl<$Res, AvailabilityReport>;
  @useResult
  $Res call({int storeId, List<AvailabilityItem> items, String? clientUuid});
}

/// @nodoc
class _$AvailabilityReportCopyWithImpl<$Res, $Val extends AvailabilityReport>
    implements $AvailabilityReportCopyWith<$Res> {
  _$AvailabilityReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? items = null,
    Object? clientUuid = freezed,
  }) {
    return _then(
      _value.copyWith(
            storeId: null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                      as int,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<AvailabilityItem>,
            clientUuid: freezed == clientUuid
                ? _value.clientUuid
                : clientUuid // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailabilityReportImplCopyWith<$Res>
    implements $AvailabilityReportCopyWith<$Res> {
  factory _$$AvailabilityReportImplCopyWith(
    _$AvailabilityReportImpl value,
    $Res Function(_$AvailabilityReportImpl) then,
  ) = __$$AvailabilityReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int storeId, List<AvailabilityItem> items, String? clientUuid});
}

/// @nodoc
class __$$AvailabilityReportImplCopyWithImpl<$Res>
    extends _$AvailabilityReportCopyWithImpl<$Res, _$AvailabilityReportImpl>
    implements _$$AvailabilityReportImplCopyWith<$Res> {
  __$$AvailabilityReportImplCopyWithImpl(
    _$AvailabilityReportImpl _value,
    $Res Function(_$AvailabilityReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailabilityReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? items = null,
    Object? clientUuid = freezed,
  }) {
    return _then(
      _$AvailabilityReportImpl(
        storeId: null == storeId
            ? _value.storeId
            : storeId // ignore: cast_nullable_to_non_nullable
                  as int,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<AvailabilityItem>,
        clientUuid: freezed == clientUuid
            ? _value.clientUuid
            : clientUuid // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AvailabilityReportImpl implements _AvailabilityReport {
  const _$AvailabilityReportImpl({
    required this.storeId,
    required final List<AvailabilityItem> items,
    this.clientUuid,
  }) : _items = items;

  @override
  final int storeId;
  final List<AvailabilityItem> _items;
  @override
  List<AvailabilityItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? clientUuid;

  @override
  String toString() {
    return 'AvailabilityReport(storeId: $storeId, items: $items, clientUuid: $clientUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityReportImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.clientUuid, clientUuid) ||
                other.clientUuid == clientUuid));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    storeId,
    const DeepCollectionEquality().hash(_items),
    clientUuid,
  );

  /// Create a copy of AvailabilityReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityReportImplCopyWith<_$AvailabilityReportImpl> get copyWith =>
      __$$AvailabilityReportImplCopyWithImpl<_$AvailabilityReportImpl>(
        this,
        _$identity,
      );
}

abstract class _AvailabilityReport implements AvailabilityReport {
  const factory _AvailabilityReport({
    required final int storeId,
    required final List<AvailabilityItem> items,
    final String? clientUuid,
  }) = _$AvailabilityReportImpl;

  @override
  int get storeId;
  @override
  List<AvailabilityItem> get items;
  @override
  String? get clientUuid;

  /// Create a copy of AvailabilityReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityReportImplCopyWith<_$AvailabilityReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PromoReport {
  int get storeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<int>? get productIds => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Create a copy of PromoReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoReportCopyWith<PromoReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoReportCopyWith<$Res> {
  factory $PromoReportCopyWith(
    PromoReport value,
    $Res Function(PromoReport) then,
  ) = _$PromoReportCopyWithImpl<$Res, PromoReport>;
  @useResult
  $Res call({
    int storeId,
    String title,
    String? description,
    List<int>? productIds,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class _$PromoReportCopyWithImpl<$Res, $Val extends PromoReport>
    implements $PromoReportCopyWith<$Res> {
  _$PromoReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? title = null,
    Object? description = freezed,
    Object? productIds = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            storeId: null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            productIds: freezed == productIds
                ? _value.productIds
                : productIds // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoReportImplCopyWith<$Res>
    implements $PromoReportCopyWith<$Res> {
  factory _$$PromoReportImplCopyWith(
    _$PromoReportImpl value,
    $Res Function(_$PromoReportImpl) then,
  ) = __$$PromoReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int storeId,
    String title,
    String? description,
    List<int>? productIds,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class __$$PromoReportImplCopyWithImpl<$Res>
    extends _$PromoReportCopyWithImpl<$Res, _$PromoReportImpl>
    implements _$$PromoReportImplCopyWith<$Res> {
  __$$PromoReportImplCopyWithImpl(
    _$PromoReportImpl _value,
    $Res Function(_$PromoReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? title = null,
    Object? description = freezed,
    Object? productIds = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(
      _$PromoReportImpl(
        storeId: null == storeId
            ? _value.storeId
            : storeId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        productIds: freezed == productIds
            ? _value._productIds
            : productIds // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$PromoReportImpl implements _PromoReport {
  const _$PromoReportImpl({
    required this.storeId,
    required this.title,
    this.description,
    final List<int>? productIds,
    this.startDate,
    this.endDate,
  }) : _productIds = productIds;

  @override
  final int storeId;
  @override
  final String title;
  @override
  final String? description;
  final List<int>? _productIds;
  @override
  List<int>? get productIds {
    final value = _productIds;
    if (value == null) return null;
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'PromoReport(storeId: $storeId, title: $title, description: $description, productIds: $productIds, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoReportImpl &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._productIds,
              _productIds,
            ) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    storeId,
    title,
    description,
    const DeepCollectionEquality().hash(_productIds),
    startDate,
    endDate,
  );

  /// Create a copy of PromoReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoReportImplCopyWith<_$PromoReportImpl> get copyWith =>
      __$$PromoReportImplCopyWithImpl<_$PromoReportImpl>(this, _$identity);
}

abstract class _PromoReport implements PromoReport {
  const factory _PromoReport({
    required final int storeId,
    required final String title,
    final String? description,
    final List<int>? productIds,
    final DateTime? startDate,
    final DateTime? endDate,
  }) = _$PromoReportImpl;

  @override
  int get storeId;
  @override
  String get title;
  @override
  String? get description;
  @override
  List<int>? get productIds;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of PromoReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoReportImplCopyWith<_$PromoReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
