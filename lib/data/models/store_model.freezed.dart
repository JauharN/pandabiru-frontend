// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get code => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get owner => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_hour')
  @HiveField(6)
  String? get openHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_hour')
  @HiveField(7)
  String? get closeHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  @HiveField(8)
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this StoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String code,
      @HiveField(2) String name,
      @HiveField(3) String? address,
      @HiveField(4) String? owner,
      @HiveField(5) String? phone,
      @JsonKey(name: 'open_hour') @HiveField(6) String? openHour,
      @JsonKey(name: 'close_hour') @HiveField(7) String? closeHour,
      @JsonKey(name: 'image_url') @HiveField(8) String? imageUrl});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? phone = freezed,
    Object? openHour = freezed,
    Object? closeHour = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      openHour: freezed == openHour
          ? _value.openHour
          : openHour // ignore: cast_nullable_to_non_nullable
              as String?,
      closeHour: freezed == closeHour
          ? _value.closeHour
          : closeHour // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String code,
      @HiveField(2) String name,
      @HiveField(3) String? address,
      @HiveField(4) String? owner,
      @HiveField(5) String? phone,
      @JsonKey(name: 'open_hour') @HiveField(6) String? openHour,
      @JsonKey(name: 'close_hour') @HiveField(7) String? closeHour,
      @JsonKey(name: 'image_url') @HiveField(8) String? imageUrl});
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? phone = freezed,
    Object? openHour = freezed,
    Object? closeHour = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$StoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      openHour: freezed == openHour
          ? _value.openHour
          : openHour // ignore: cast_nullable_to_non_nullable
              as String?,
      closeHour: freezed == closeHour
          ? _value.closeHour
          : closeHour // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreModelImpl implements _StoreModel {
  const _$StoreModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.code,
      @HiveField(2) required this.name,
      @HiveField(3) this.address,
      @HiveField(4) this.owner,
      @HiveField(5) this.phone,
      @JsonKey(name: 'open_hour') @HiveField(6) this.openHour,
      @JsonKey(name: 'close_hour') @HiveField(7) this.closeHour,
      @JsonKey(name: 'image_url') @HiveField(8) this.imageUrl});

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String code;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final String? address;
  @override
  @HiveField(4)
  final String? owner;
  @override
  @HiveField(5)
  final String? phone;
  @override
  @JsonKey(name: 'open_hour')
  @HiveField(6)
  final String? openHour;
  @override
  @JsonKey(name: 'close_hour')
  @HiveField(7)
  final String? closeHour;
  @override
  @JsonKey(name: 'image_url')
  @HiveField(8)
  final String? imageUrl;

  @override
  String toString() {
    return 'StoreModel(id: $id, code: $code, name: $name, address: $address, owner: $owner, phone: $phone, openHour: $openHour, closeHour: $closeHour, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.openHour, openHour) ||
                other.openHour == openHour) &&
            (identical(other.closeHour, closeHour) ||
                other.closeHour == closeHour) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, address, owner,
      phone, openHour, closeHour, imageUrl);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel implements StoreModel {
  const factory _StoreModel(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String code,
          @HiveField(2) required final String name,
          @HiveField(3) final String? address,
          @HiveField(4) final String? owner,
          @HiveField(5) final String? phone,
          @JsonKey(name: 'open_hour') @HiveField(6) final String? openHour,
          @JsonKey(name: 'close_hour') @HiveField(7) final String? closeHour,
          @JsonKey(name: 'image_url') @HiveField(8) final String? imageUrl}) =
      _$StoreModelImpl;

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get code;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  String? get address;
  @override
  @HiveField(4)
  String? get owner;
  @override
  @HiveField(5)
  String? get phone;
  @override
  @JsonKey(name: 'open_hour')
  @HiveField(6)
  String? get openHour;
  @override
  @JsonKey(name: 'close_hour')
  @HiveField(7)
  String? get closeHour;
  @override
  @JsonKey(name: 'image_url')
  @HiveField(8)
  String? get imageUrl;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
