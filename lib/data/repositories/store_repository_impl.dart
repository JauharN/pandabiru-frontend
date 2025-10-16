import 'package:dio/dio.dart';
import 'package:pandabiru_app/data/models/store_model.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/result.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasources/local/store_local_datasource.dart';
import '../datasources/remote/store_remote_datasource.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource remote;
  final StoreLocalDataSource local;
  final NetworkInfo network;
  final Duration cacheTtl;

  StoreRepositoryImpl({
    required this.remote,
    required this.local,
    required this.network,
    this.cacheTtl = const Duration(hours: 12),
  });

  bool _fresh(DateTime? t) =>
      t != null && DateTime.now().difference(t) <= cacheTtl;

  @override
  Future<Result<List<Store>>> getStores({bool forceRefresh = false}) async {
    try {
      final online = await network.isConnected;

      if (forceRefresh && online) {
        final items = await remote.getStores();
        await local.cacheStores(items);
        return Result.success(items.map((e) => e.toEntity()).toList());
      }

      if (!online) {
        final cached = await local.getCachedStores();
        return cached.isNotEmpty
            ? Result.success(cached.map((e) => e.toEntity()).toList())
            : Result.failure(Failure.cache('Tidak ada data offline.'));
      }

      if (!forceRefresh && _fresh(local.lastUpdated())) {
        final cached = await local.getCachedStores();
        if (cached.isNotEmpty) {
          return Result.success(cached.map((e) => e.toEntity()).toList());
        }
      }

      final items = await remote.getStores();
      await local.cacheStores(items);
      return Result.success(items.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      final cached = await local.getCachedStores();
      if (cached.isNotEmpty) {
        return Result.success(cached.map((e) => e.toEntity()).toList());
      }
      return Result.failure(Failure.server(e.message));
    } catch (e) {
      final cached = await local.getCachedStores();
      if (cached.isNotEmpty) {
        return Result.success(cached.map((e) => e.toEntity()).toList());
      }
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Result<Store>> getStoreById(int id) async {
    try {
      if (await network.isConnected) {
        final m = await remote.getStoreById(id);
        // upsert ke cache
        final list = await local.getCachedStores();
        final idx = list.indexWhere((e) => e.id == m.id);
        if (idx >= 0) {
          list[idx] = m;
        } else {
          list.add(m);
        }
        await local.cacheStores(list);
        return Result.success(m.toEntity());
      }
      final cached = await local.getCachedStores();
      final hit = cached.firstWhere(
        (e) => e.id == id,
        orElse: () => throw 'notfound',
      );
      return Result.success(hit.toEntity());
    } on ServerException catch (e) {
      return Result.failure(Failure.server(e.message));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Result.failure(Failure.server('Store tidak ditemukan'));
      }
      return Result.failure(Failure.unknown(e.message ?? e.toString()));
    } catch (e) {
      if (e == 'notfound') {
        return Result.failure(
          Failure.cache('Data toko tidak tersedia offline.'),
        );
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
