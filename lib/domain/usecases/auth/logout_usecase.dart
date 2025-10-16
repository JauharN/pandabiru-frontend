import 'package:pandabiru_app/domain/repositories/auth_repository.dart';
import 'package:pandabiru_app/domain/usecases/usecase.dart';

import '../../../core/utils/result.dart';

class LogoutUsecase extends UseCase<void, NoParams> {
  final AuthRepository repository;
  LogoutUsecase(this.repository);

  @override
  Future<Result<void>> call(NoParams params) => repository.logout();
}
