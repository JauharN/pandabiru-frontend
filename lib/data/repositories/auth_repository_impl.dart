import 'package:dio/dio.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_datasource.dart';
import '../datasources/remote/auth_remote_datasource.dart';
import '../models/auth/login_request_model.dart';
import '../models/auth/login_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDatasource local;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<Result<User>> login(String email, String password) async {
    if (!await networkInfo.isConnected) {
      return const FailureResult(NetworkFailure('Tidak ada koneksi Internet'));
    }

    try {
      final res = await remote.login(
        LoginRequestModel(email: email, password: password),
      );

      // simpan token
      await local.saveToken(res.token);

      // map ke domain entity
      final user = _mapLoginResponseToUser(res);

      return Success(user);
    } on DioException catch (e) {
      // mapping error dari server -> Failure informatif
      final msg = _extractMessage(e);
      if (e.response?.statusCode == 401) {
        return FailureResult(AuthFailure(msg));
      }
      return FailureResult(ServerFailure(msg));
    } on CacheException catch (e) {
      return FailureResult(CacheFailure(e.message));
    } on Exception {
      return const FailureResult(
        ServerFailure('Terjadi kesalahan tak terduga'),
      );
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      // panggil server
      await remote.logout();

      // hapus token
      await local.clearToken();

      return const Success(null);
    } on DioException catch (e) {
      await local.clearToken();
      final msg = _extractMessage(e);
      return FailureResult(ServerFailure(msg));
    } on Exception {
      await local.clearToken();
      return const FailureResult(ServerFailure('Gagal logout'));
    }
  }

  // Helper
  User _mapLoginResponseToUser(LoginResponseModel res) {
    return User(
      id: res.user.id,
      name: res.user.name,
      email: res.user.email,
      token: res.token,
    );
  }

  String _extractMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.message ?? 'Server tidak merespon';
  }
}
