// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 5;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      name: fields[1] as String,
      barcode: fields[7] as String?,
      size: fields[8] as String?,
      imageUrl: fields[6] as String?,
      code: fields[2] as String?,
      price: fields[3] as double?,
      unit: fields[4] as String?,
      stock: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.barcode)
      ..writeByte(8)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.stock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      barcode: json['barcode'] as String?,
      size: json['size'] as String?,
      imageUrl: json['image_url'] as String?,
      code: json['code'] as String?,
      price: const _NumToDouble().fromJson(json['price']),
      unit: json['unit'] as String?,
      stock: const _NumToInt().fromJson(json['stock']),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'barcode': instance.barcode,
      'size': instance.size,
      'image_url': instance.imageUrl,
      'code': instance.code,
      'price': const _NumToDouble().toJson(instance.price),
      'unit': instance.unit,
      'stock': const _NumToInt().toJson(instance.stock),
    };
