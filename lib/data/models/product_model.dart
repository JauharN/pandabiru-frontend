import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

class _NumToDouble implements JsonConverter<double?, Object?> {
  const _NumToDouble();
  @override
  double? fromJson(Object? json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    if (json is String) return double.tryParse(json.trim());
    return null;
  }

  @override
  Object? toJson(double? object) => object;
}

class _NumToInt implements JsonConverter<int?, Object?> {
  const _NumToInt();
  @override
  int? fromJson(Object? json) {
    if (json == null) return null;
    if (json is num) return json.toInt();
    if (json is String) return int.tryParse(json.trim());
    return null;
  }

  @override
  Object? toJson(int? object) => object;
}

@freezed
@HiveType(typeId: 5, adapterName: 'ProductModelAdapter')
class ProductModel with _$ProductModel {
  // NOTE: jaga typeId tetap sama, tambahkan field baru pakai index baru
  const factory ProductModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,

    // Backend fields
    @HiveField(7) String? barcode,
    @HiveField(8) String? size,
    @JsonKey(name: 'image_url') @HiveField(6) String? imageUrl,

    // Optional metadata
    @HiveField(2) String? code,
    @_NumToDouble() @HiveField(3) double? price,
    @HiveField(4) String? unit,
    @_NumToInt() @HiveField(5) int? stock,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelMapper on ProductModel {
  Product toEntity() => Product(
    id: id,
    name: name,
    barcode: barcode,
    size: size,
    imageUrl: imageUrl,
    code: code,
    price: price,
    unit: unit,
    stock: stock,
  );
}
