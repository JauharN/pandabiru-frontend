import '../../../core/storage/secure_storage.dart';

abstract class AuthLocalDatasource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDatasource {
  final SecureStorage secureStorage;
  AuthLocalDataSourceImpl(this.secureStorage);

  @override
  Future<void> clearToken() => secureStorage.clearToken();

  @override
  Future<String?> getToken() => secureStorage.getToken();

  @override
  Future<void> saveToken(String token) => secureStorage.saveToken(token);
}
