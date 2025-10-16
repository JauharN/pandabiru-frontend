import 'package:hive/hive.dart';

import '../../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>> getCachedProducts();
  DateTime? lastUpdated();
  Future<void> clear();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const _boxName = 'productsBox';
  static const _itemsKey = 'items';
  static const _updatedAtKey = 'updatedAt';

  Box get _box => Hive.box(_boxName);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await _box.put(_itemsKey, products);
    await _box.put(_updatedAtKey, DateTime.now().toIso8601String());
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final data = _box.get(_itemsKey) as List<dynamic>?;
    if (data == null) return [];
    return data.cast<ProductModel>();
  }

  @override
  DateTime? lastUpdated() {
    final raw = _box.get(_updatedAtKey) as String?;
    return raw != null ? DateTime.tryParse(raw) : null;
  }

  @override
  Future<void> clear() => _box.clear();
}
