import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];

  static ServerFailure server([String message = 'Server failure']) =>
      ServerFailure(message);
  static CacheFailure cache([String message = 'Cache failure']) =>
      CacheFailure(message);
  static NetworkFailure network([String message = 'Network failure']) =>
      NetworkFailure(message);
  static AuthFailure auth([String message = 'Authentication failure']) =>
      AuthFailure(message);
  static UnknownFailure unknown([String message = 'Unknown failure']) =>
      UnknownFailure(message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server failure']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache failure']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network failure']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failure']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unknown failure']);
}
