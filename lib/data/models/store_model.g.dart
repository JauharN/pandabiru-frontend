// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreModelAdapter extends TypeAdapter<StoreModel> {
  @override
  final int typeId = 4;

  @override
  StoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreModel(
      id: fields[0] as int,
      code: fields[1] as String,
      name: fields[2] as String,
      address: fields[3] as String?,
      owner: fields[4] as String?,
      phone: fields[5] as String?,
      openHour: fields[6] as String?,
      closeHour: fields[7] as String?,
      imageUrl: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.owner)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.openHour)
      ..writeByte(7)
      ..write(obj.closeHour)
      ..writeByte(8)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      owner: json['owner'] as String?,
      phone: json['phone'] as String?,
      openHour: json['open_hour'] as String?,
      closeHour: json['close_hour'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'address': instance.address,
      'owner': instance.owner,
      'phone': instance.phone,
      'open_hour': instance.openHour,
      'close_hour': instance.closeHour,
      'image_url': instance.imageUrl,
    };
