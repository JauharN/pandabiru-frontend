import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/core_providers.dart';
import '../datasources/remote/product_remote_datasource.dart';

final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((
  ref,
) {
  final Dio dio = ref.read(dioProvider);
  return ProductRemoteDataSource(dio);
});
