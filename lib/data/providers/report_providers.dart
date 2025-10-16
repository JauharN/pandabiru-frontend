import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../../domain/repositories/report_repository.dart';
import '../datasources/local/sync_queue_local_datasource.dart';
import '../datasources/remote/report_remote_datasource.dart';
import '../repositories/report_repository_impl.dart';

final reportRemoteDataSourceProvider = Provider<ReportRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return ReportRemoteDataSource(dio);
});

final syncQueueLocalDataSourceProvider = Provider<SyncQueueLocalDataSource>((
  ref,
) {
  return SyncQueueLocalDataSourceImpl();
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  final remote = ref.read(reportRemoteDataSourceProvider);
  final queue = ref.read(syncQueueLocalDataSourceProvider);
  final net = ref.read(networkInfoProvider);
  return ReportRepositoryImpl(remote: remote, queue: queue, network: net);
});
