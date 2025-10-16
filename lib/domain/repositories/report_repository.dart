import '../../core/utils/result.dart';
import '../entities/report.dart';
import '../entities/summary.dart';

abstract class ReportRepository {
  Future<Result<void>> submitAttendance(AttendanceReport report);
  Future<Result<void>> submitAvailability(AvailabilityReport report);
  Future<Result<void>> submitPromo(PromoReport report);
  Future<Result<Summary>> getSummary();
  Future<int> flushQueue();
}
