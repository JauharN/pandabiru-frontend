import 'package:pandabiru_app/data/models/product_model.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/result.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/local/product_local_datasource.dart';
import '../datasources/remote/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;
  final NetworkInfo network;
  final Duration cacheTtl;

  ProductRepositoryImpl({
    required this.remote,
    required this.local,
    required this.network,
    this.cacheTtl = const Duration(hours: 12),
  });

  bool _fresh(DateTime? t) =>
      t != null && DateTime.now().difference(t) <= cacheTtl;

  @override
  Future<Result<List<Product>>> getProducts({bool forceRefresh = false}) async {
    try {
      final online = await network.isConnected;

      if (forceRefresh && online) {
        final items = await remote.getProducts();
        await local.cacheProducts(items);
        return Result.success(items.map((e) => e.toEntity()).toList());
      }

      if (!online) {
        final cached = await local.getCachedProducts();
        return cached.isNotEmpty
            ? Result.success(cached.map((e) => e.toEntity()).toList())
            : Result.failure(Failure.cache('Tidak ada data offline.'));
      }

      if (!forceRefresh && _fresh(local.lastUpdated())) {
        final cached = await local.getCachedProducts();
        if (cached.isNotEmpty) {
          return Result.success(cached.map((e) => e.toEntity()).toList());
        }
      }

      final items = await remote.getProducts();
      await local.cacheProducts(items);
      return Result.success(items.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      final cached = await local.getCachedProducts();
      if (cached.isNotEmpty) {
        return Result.success(cached.map((e) => e.toEntity()).toList());
      }
      return Result.failure(Failure.server(e.message));
    } catch (e) {
      final cached = await local.getCachedProducts();
      if (cached.isNotEmpty) {
        return Result.success(cached.map((e) => e.toEntity()).toList());
      }
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<void>> clearCache() async {
    try {
      await local.clear();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.cache('Gagal clear cache: $e'));
    }
  }
}
