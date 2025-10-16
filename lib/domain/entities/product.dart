import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    String? barcode,
    String? size,
    String? imageUrl,
    //false
    String? code,
    double? price,
    String? unit,
    int? stock,
  }) = _Product;
}
