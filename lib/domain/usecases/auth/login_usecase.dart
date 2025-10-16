import '../../../core/errors/failures.dart';
import '../../../core/utils/result.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';
import '../usecase.dart';

class LoginParams {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});
}

class LoginUsecase extends UseCase<User, LoginParams> {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Result<User>> call(LoginParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return const FailureResult(
        ServerFailure('Email dan password wajib diisi'),
      );
    }
    return repository.login(params.email, params.password);
  }
}
