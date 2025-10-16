import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../../domain/repositories/product_repository.dart';
import '../repositories/product_repository_impl.dart';
import 'product_local_provider.dart';
import 'product_remote_provider.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final remote = ref.read(productRemoteDataSourceProvider);
  final local = ref.read(productLocalDataSourceProvider);
  final net = ref.read(networkInfoProvider);
  return ProductRepositoryImpl(remote: remote, local: local, network: net);
});
