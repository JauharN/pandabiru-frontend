import '../../../core/utils/result.dart';
import '../../entities/report.dart';
import '../../repositories/report_repository.dart';

class SubmitPromoUseCase {
  final ReportRepository _repo;
  SubmitPromoUseCase(this._repo);
  Future<Result<void>> call(PromoReport r) => _repo.submitPromo(r);
}
