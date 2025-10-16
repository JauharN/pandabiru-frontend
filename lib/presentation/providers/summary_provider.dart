import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/report_providers.dart';
import '../../domain/entities/summary.dart';
import '../../domain/usecases/report/get_summary_usecase.dart';

final getSummaryUseCaseProvider = Provider<GetSummaryUseCase>((ref) {
  final repo = ref.read(reportRepositoryProvider);
  return GetSummaryUseCase(repo);
});

final summaryProvider = FutureProvider<Summary>((ref) async {
  final res = await ref.read(getSummaryUseCaseProvider).call();
  return res.when(success: (v) => v, failure: (f) => Future.error(f.message));
});
