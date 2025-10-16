import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pandabiru_app/domain/entities/store.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
@HiveType(typeId: 4, adapterName: 'StoreModelAdapter')
class StoreModel with _$StoreModel {
  const factory StoreModel({
    @HiveField(0) required int id,
    @HiveField(1) required String code,
    @HiveField(2) required String name,
    @HiveField(3) String? address,
    @HiveField(4) String? owner,
    @HiveField(5) String? phone,
    @JsonKey(name: 'open_hour') @HiveField(6) String? openHour,
    @JsonKey(name: 'close_hour') @HiveField(7) String? closeHour,
    @JsonKey(name: 'image_url') @HiveField(8) String? imageUrl,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

extension StoreModelMapper on StoreModel {
  Store toEntity() => Store(
    id: id,
    code: code,
    name: name,
    address: address,
    owner: owner,
    phone: phone,
    openHour: openHour,
    closeHour: closeHour,
    imageUrl: imageUrl,
  );

  static StoreModel fromEntity(Store e) => StoreModel(
    id: e.id,
    code: e.code,
    name: e.name,
    address: e.address,
    owner: e.owner,
    phone: e.phone,
    openHour: e.openHour,
    closeHour: e.closeHour,
    imageUrl: e.imageUrl,
  );
}
