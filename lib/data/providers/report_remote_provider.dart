import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../datasources/remote/report_remote_datasource.dart';

final reportRemoteDataSourceProvider = Provider<ReportRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return ReportRemoteDataSource(dio);
});
