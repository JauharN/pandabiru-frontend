import '../../../core/utils/result.dart';
import '../../entities/summary.dart';
import '../../repositories/report_repository.dart';

class GetSummaryUseCase {
  final ReportRepository _repo;
  GetSummaryUseCase(this._repo);
  Future<Result<Summary>> call() => _repo.getSummary();
}
