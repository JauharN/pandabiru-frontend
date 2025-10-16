import '../../../core/utils/result.dart';
import '../../entities/report.dart';
import '../../repositories/report_repository.dart';

class SubmitAttendanceUseCase {
  final ReportRepository _repo;
  SubmitAttendanceUseCase(this._repo);
  Future<Result<void>> call(AttendanceReport r) => _repo.submitAttendance(r);
}
