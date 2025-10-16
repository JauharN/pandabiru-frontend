import 'package:pandabiru_app/domain/entities/store.dart';

import '../../core/utils/result.dart';

abstract class StoreRepository {
  Future<Result<List<Store>>> getStores({bool forceRefresh = false});
  Future<Result<Store>> getStoreById(int id);
  Future<Result<void>> clearCache();
}
