import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/providers/report_providers.dart';
import '../../domain/entities/report.dart';
import '../../domain/usecases/report/submit_availability_usecase.dart';

final submitAvailabilityUseCaseProvider = Provider<SubmitAvailabilityUseCase>((
  ref,
) {
  final repo = ref.read(reportRepositoryProvider);
  return SubmitAvailabilityUseCase(repo);
});

// state: { productId: available }
class AvailabilityNotifier extends StateNotifier<Map<int, bool>> {
  final Ref ref;
  final int storeId;
  AvailabilityNotifier(this.ref, this.storeId) : super({});

  Future<void> toggle(int productId, bool value, {String? barcode}) async {
    state = {...state, productId: value}; // optimistic

    final usecase = ref.read(submitAvailabilityUseCaseProvider);
    final res = await usecase(
      AvailabilityReport(
        storeId: storeId,
        clientUuid: const Uuid().v4(),
        items: [
          AvailabilityItem(
            productId: productId,
            available: value,
            barcode: barcode,
          ),
        ],
      ),
    );
    res.when(
      success: (_) {},
      failure: (f) {
        // biarkan queued; opsional tampilkan snackbar
      },
    );
  }
}

final availabilityProvider =
    StateNotifierProvider.family<AvailabilityNotifier, Map<int, bool>, int>(
      (ref, storeId) => AvailabilityNotifier(ref, storeId),
    );
