import 'package:pandabiru_app/core/utils/result.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Result<User>> login(String email, String password);
  Future<Result<void>> logout();
}
