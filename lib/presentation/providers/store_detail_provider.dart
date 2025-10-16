import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/store_repository_provider.dart';
import '../../../domain/entities/store.dart';
import '../../../domain/usecases/store/get_store_by_id_usecase.dart';

final getStoreByIdUseCaseProvider = Provider<GetStoreByIdUsecase>((ref) {
  final repo = ref.read(storeRepositoryProvider);
  return GetStoreByIdUsecase(repo);
});

/// Ambil detail dari repo (remote -> cache), fallback error->throw message
final storeByIdProvider = FutureProvider.family<Store, int>((ref, id) async {
  final res = await ref.read(getStoreByIdUseCaseProvider).call(id);
  return res.when(success: (v) => v, failure: (f) => Future.error(f.message));
});
