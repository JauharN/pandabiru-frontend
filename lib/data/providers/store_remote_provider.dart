import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../datasources/remote/store_remote_datasource.dart';

final storeRemoteDataSourceProvider = Provider<StoreRemoteDataSource>((ref) {
  final Dio dio = ref.read(dioProvider);
  return StoreRemoteDataSource(dio);
});
