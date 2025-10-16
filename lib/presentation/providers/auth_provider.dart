import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandabiru_app/domain/usecases/auth/login_usecase.dart';
import 'package:pandabiru_app/domain/usecases/auth/logout_usecase.dart';
import 'package:pandabiru_app/di/core_providers.dart';

import '../../core/utils/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/usecase.dart';

// Usecase Providers
final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUsecase(repo);
});

final logoutUseCaseProvider = Provider<LogoutUsecase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LogoutUsecase(repo);
});

// Controller / Notifier
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final LoginUsecase _login;
  final LogoutUsecase _logout;

  AuthNotifier({required LoginUsecase login, required LogoutUsecase logout})
    : _login = login,
      _logout = logout,
      super(const AsyncData<User?>(null));

  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final result = await _login(LoginParams(email: email, password: password));

    result.when(
      success: (user) => state = AsyncData(user),
      failure: (f) => state = AsyncError(f, StackTrace.current),
    );

    return result;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final res = await _logout(const NoParams());
    res.when(
      success: (_) => state = const AsyncData(null),
      failure: (f) => state = AsyncError(f, StackTrace.current),
    );
  }
}

// Global Provider
final authControllerProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
      return AuthNotifier(
        login: ref.watch(loginUsecaseProvider),
        logout: ref.watch(logoutUseCaseProvider),
      );
    });

// Derived: apakah sudah login?
final isAuthenticatedProvider = Provider<bool>((ref) {
  final state = ref.watch(authControllerProvider);
  return state.maybeWhen(data: (u) => u != null, orElse: () => false);
});
