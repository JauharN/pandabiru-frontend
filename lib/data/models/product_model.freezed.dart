// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError; // Backend fields
  @HiveField(7)
  String? get barcode => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  @HiveField(6)
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Optional metadata
  @HiveField(2)
  String? get code => throw _privateConstructorUsedError;
  @_NumToDouble()
  @HiveField(3)
  double? get price => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get unit => throw _privateConstructorUsedError;
  @_NumToInt()
  @HiveField(5)
  int? get stock => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(7) String? barcode,
      @HiveField(8) String? size,
      @JsonKey(name: 'image_url') @HiveField(6) String? imageUrl,
      @HiveField(2) String? code,
      @_NumToDouble() @HiveField(3) double? price,
      @HiveField(4) String? unit,
      @_NumToInt() @HiveField(5) int? stock});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? barcode = freezed,
    Object? size = freezed,
    Object? imageUrl = freezed,
    Object? code = freezed,
    Object? price = freezed,
    Object? unit = freezed,
    Object? stock = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(7) String? barcode,
      @HiveField(8) String? size,
      @JsonKey(name: 'image_url') @HiveField(6) String? imageUrl,
      @HiveField(2) String? code,
      @_NumToDouble() @HiveField(3) double? price,
      @HiveField(4) String? unit,
      @_NumToInt() @HiveField(5) int? stock});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? barcode = freezed,
    Object? size = freezed,
    Object? imageUrl = freezed,
    Object? code = freezed,
    Object? price = freezed,
    Object? unit = freezed,
    Object? stock = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(7) this.barcode,
      @HiveField(8) this.size,
      @JsonKey(name: 'image_url') @HiveField(6) this.imageUrl,
      @HiveField(2) this.code,
      @_NumToDouble() @HiveField(3) this.price,
      @HiveField(4) this.unit,
      @_NumToInt() @HiveField(5) this.stock});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
// Backend fields
  @override
  @HiveField(7)
  final String? barcode;
  @override
  @HiveField(8)
  final String? size;
  @override
  @JsonKey(name: 'image_url')
  @HiveField(6)
  final String? imageUrl;
// Optional metadata
  @override
  @HiveField(2)
  final String? code;
  @override
  @_NumToDouble()
  @HiveField(3)
  final double? price;
  @override
  @HiveField(4)
  final String? unit;
  @override
  @_NumToInt()
  @HiveField(5)
  final int? stock;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, barcode: $barcode, size: $size, imageUrl: $imageUrl, code: $code, price: $price, unit: $unit, stock: $stock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.stock, stock) || other.stock == stock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, barcode, size, imageUrl, code, price, unit, stock);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(7) final String? barcode,
      @HiveField(8) final String? size,
      @JsonKey(name: 'image_url') @HiveField(6) final String? imageUrl,
      @HiveField(2) final String? code,
      @_NumToDouble() @HiveField(3) final double? price,
      @HiveField(4) final String? unit,
      @_NumToInt() @HiveField(5) final int? stock}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name; // Backend fields
  @override
  @HiveField(7)
  String? get barcode;
  @override
  @HiveField(8)
  String? get size;
  @override
  @JsonKey(name: 'image_url')
  @HiveField(6)
  String? get imageUrl; // Optional metadata
  @override
  @HiveField(2)
  String? get code;
  @override
  @_NumToDouble()
  @HiveField(3)
  double? get price;
  @override
  @HiveField(4)
  String? get unit;
  @override
  @_NumToInt()
  @HiveField(5)
  int? get stock;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
