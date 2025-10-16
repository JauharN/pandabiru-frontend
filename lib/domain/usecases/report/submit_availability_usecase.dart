import '../../../core/utils/result.dart';
import '../../entities/report.dart';
import '../../repositories/report_repository.dart';

class SubmitAvailabilityUseCase {
  final ReportRepository _repo;
  SubmitAvailabilityUseCase(this._repo);
  Future<Result<void>> call(AvailabilityReport r) =>
      _repo.submitAvailability(r);
}
