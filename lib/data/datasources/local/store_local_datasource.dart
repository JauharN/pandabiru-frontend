import 'package:hive/hive.dart';

import '../../models/store_model.dart';

abstract class StoreLocalDataSource {
  Future<void> cacheStores(List<StoreModel> stores);
  Future<List<StoreModel>> getCachedStores();
  DateTime? lastUpdated();
  Future<void> clear();
  Future<StoreModel?> getCachedStoreById(int id);
}

class StoreLocalDataSourceImpl implements StoreLocalDataSource {
  static const _boxName = 'storesBox';
  static const _itemsKey = 'items';
  static const _updatedAtKey = 'updatedAt';

  Box get _box => Hive.box(_boxName);

  @override
  Future<void> cacheStores(List<StoreModel> stores) async {
    await _box.put(_itemsKey, stores);
    await _box.put(_updatedAtKey, DateTime.now().toIso8601String());
  }

  @override
  Future<List<StoreModel>> getCachedStores() async {
    final data = _box.get(_itemsKey) as List<dynamic>?;
    if (data == null) return [];
    return data.cast<StoreModel>();
  }

  @override
  DateTime? lastUpdated() {
    final raw = _box.get(_updatedAtKey) as String?;
    return raw != null ? DateTime.tryParse(raw) : null;
  }

  @override
  Future<void> clear() => _box.clear();

  @override
  Future<StoreModel?> getCachedStoreById(int id) async {
    final list = await getCachedStores();
    try {
      return list.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}
