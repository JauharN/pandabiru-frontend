// contoh: lib/presentation/providers/core_providers.dart (sebagian)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../core/network/dio_client.dart';
import '../core/network/interceptors/auth_interceptor.dart';
import '../core/network/network_info.dart';
import '../core/storage/secure_storage.dart';
import '../data/datasources/remote/auth_remote_datasource.dart';
import '../data/datasources/local/auth_local_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final secureStorageProvider = Provider((ref) => SecureStorage());
final authInterceptorProvider = Provider(
  (ref) => AuthInterceptor(ref.read(secureStorageProvider)),
);
final dioProvider = Provider<Dio>(
  (ref) => DioClient.createDefault(ref.read(authInterceptorProvider)),
);
final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(InternetConnection()),
);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(ref.read(dioProvider));
});

final authLocalDataSourceProvider = Provider<AuthLocalDatasource>((ref) {
  return AuthLocalDataSourceImpl(ref.read(secureStorageProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remote: ref.read(authRemoteDataSourceProvider),
    local: ref.read(authLocalDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  );
});
