import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _keyToken = 'access_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async =>
      _storage.write(key: _keyToken, value: token);
  Future<String?> getToken() async => _storage.read(key: _keyToken);
  Future<void> clearToken() async => _storage.delete(key: _keyToken);
}
