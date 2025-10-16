import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/store_repository_provider.dart';
import '../../data/providers/report_providers.dart';
import '../../domain/entities/store.dart';
import '../../domain/usecases/store/get_stores_usecase.dart';

final getStoresUseCaseProvider = Provider<GetStoresUsecase>((ref) {
  final repo = ref.read(storeRepositoryProvider);
  return GetStoresUsecase(repo);
});

class StoreListController extends AsyncNotifier<List<Store>> {
  @override
  Future<List<Store>> build() async {
    unawaited(ref.read(reportRepositoryProvider).flushQueue());
    final usecase = ref.read(getStoresUseCaseProvider);
    final res = await usecase();
    return res.when(
      success: (data) => data,
      failure: (f) => Future.error(f.message),
    );
  }

  Future<void> refresh() async {
    unawaited(ref.read(reportRepositoryProvider).flushQueue());
    final usecase = ref.read(getStoresUseCaseProvider);
    state = const AsyncLoading();
    final res = await usecase(forceRefresh: true);
    state = res.when(
      success: AsyncData.new,
      failure: (f) => AsyncError(f.message, StackTrace.current),
    );
  }
}

final storeListControllerProvider =
    AsyncNotifierProvider<StoreListController, List<Store>>(
      StoreListController.new,
    );
