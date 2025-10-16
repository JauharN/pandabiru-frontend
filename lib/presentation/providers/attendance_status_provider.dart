import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

// state: tombol sedang kirim?
final attendanceSubmittingProvider = StateProvider<bool>((_) => false);

// pilihan status yang dikirim ke backend
enum AttendanceStatusChoice { present, absent }

extension AttendanceStatusChoiceX on AttendanceStatusChoice {
  String get label => switch (this) {
    AttendanceStatusChoice.present => 'Hadir',
    AttendanceStatusChoice.absent => 'Tidak Hadir',
  };

  String get payload => switch (this) {
    AttendanceStatusChoice.present => 'present',
    AttendanceStatusChoice.absent => 'absent',
  };
}

final attendanceStatusSelectionProvider = StateProvider<AttendanceStatusChoice>(
  (_) => AttendanceStatusChoice.present,
);

// box untuk simpan flag absen harian
final attendanceBoxProvider = Provider<Box>((ref) => Hive.box('kvBox'));

const _presentMonthlyKey = 'attendance_present_monthly';

// key harian: attendance_YYYYMMDD
String _todayKey() {
  final now = DateTime.now();
  return 'attendance_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
}

String _todayStatusKey() => '${_todayKey()}_status';

String _currentMonthKey() {
  final now = DateTime.now();
  return '${now.year}-${now.month.toString().padLeft(2, '0')}';
}

AttendanceStatusChoice? _statusFromString(String? raw) {
  if (raw == null) return null;
  for (final value in AttendanceStatusChoice.values) {
    if (value.name == raw) return value;
  }
  return null;
}

// apakah sudah absen hari ini?
final attendanceTodayDoneProvider = FutureProvider<bool>((ref) async {
  final box = ref.read(attendanceBoxProvider);
  return (box.get(_todayKey()) as bool?) ?? false;
});

final attendanceTodayStatusProvider = FutureProvider<AttendanceStatusChoice?>((
  ref,
) async {
  final box = ref.read(attendanceBoxProvider);
  final raw = box.get(_todayStatusKey()) as String?;
  return _statusFromString(raw);
});

final attendanceTotalPresentProvider = FutureProvider<int>((ref) async {
  final box = ref.read(attendanceBoxProvider);
  final raw = box.get(_presentMonthlyKey);
  if (raw is Map) {
    final monthMap = Map<String, dynamic>.from(raw);
    final value = monthMap[_currentMonthKey()];
    if (value is num) return value.toInt();
  }
  return 0;
});

// service kecil untuk set/clear
class AttendanceService {
  final Box box;
  AttendanceService(this.box);

  Future<void> markToday(AttendanceStatusChoice status) async {
    final statusKey = _todayStatusKey();
    final prevStatus = _statusFromString(box.get(statusKey) as String?);
    final monthKey = _currentMonthKey();
    final monthlyCounts = _readMonthlyCounts();

    if (status == AttendanceStatusChoice.present &&
        prevStatus != AttendanceStatusChoice.present) {
      final current = monthlyCounts[monthKey] ?? 0;
      monthlyCounts[monthKey] = current + 1;
      await _saveMonthlyCounts(monthlyCounts);
    }

    if (status == AttendanceStatusChoice.absent &&
        prevStatus == AttendanceStatusChoice.present) {
      final current = monthlyCounts[monthKey] ?? 0;
      if (current > 0) {
        monthlyCounts[monthKey] = current - 1;
        await _saveMonthlyCounts(monthlyCounts);
      }
    }

    await box.put(_todayKey(), true);
    await box.put(statusKey, status.name);
  }

  Future<void> markTodayPresent() => markToday(AttendanceStatusChoice.present);

  Future<void> clearToday() async {
    final statusKey = _todayStatusKey();
    final prevStatus = _statusFromString(box.get(statusKey) as String?);
    final monthKey = _currentMonthKey();
    final monthlyCounts = _readMonthlyCounts();
    if (prevStatus == AttendanceStatusChoice.present) {
      final current = monthlyCounts[monthKey] ?? 0;
      if (current > 0) {
        monthlyCounts[monthKey] = current - 1;
        await _saveMonthlyCounts(monthlyCounts);
      }
    }
    await box.delete(_todayKey());
    await box.delete(statusKey);
  }

  Map<String, int> _readMonthlyCounts() {
    final raw = box.get(_presentMonthlyKey);
    if (raw is Map) {
      final result = <String, int>{};
      raw.forEach((key, value) {
        if (key is String && value is num) {
          result[key] = value.toInt();
        }
      });
      return result;
    }
    return <String, int>{};
  }

  Future<void> _saveMonthlyCounts(Map<String, int> counts) async {
    await box.put(_presentMonthlyKey, counts);
  }
}

final attendanceServiceProvider = Provider<AttendanceService>((ref) {
  return AttendanceService(ref.read(attendanceBoxProvider));
});
