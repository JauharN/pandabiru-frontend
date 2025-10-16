import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../../domain/repositories/store_repository.dart';
import '../repositories/store_repository_impl.dart';
import 'store_local_provider.dart';
import 'store_remote_provider.dart';

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  final remote = ref.read(storeRemoteDataSourceProvider);
  final local = ref.read(storeLocalDataSourceProvider);
  final net = ref.read(networkInfoProvider);
  return StoreRepositoryImpl(remote: remote, local: local, network: net);
});
