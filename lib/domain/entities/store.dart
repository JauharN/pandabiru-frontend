import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  const Store._();

  const factory Store({
    required int id,
    required String code,
    required String name,
    String? address,
    String? owner,
    String? phone,
    String? openHour,
    String? closeHour,
    String? imageUrl,
  }) = _Store;

  bool get isOpenNow {
    if (openHour == null || closeHour == null) return false;
    final open = _parse(openHour!), close = _parse(closeHour!);
    if (open == null || close == null) return false;
    final now = DateTime.now();
    final cur = now.hour * 60 + now.minute;
    final o = open.hour * 60 + open.minute;
    final c = close.hour * 60 + close.minute;
    if (o <= c) {
      // Buka dan tutup di hari yang sama (misal 08:00 - 17:00)
      return cur >= o && cur <= c;
    } else {
      // Buka malam, tutup pagi (misal 22:00 - 06:00)
      return cur >= o || cur <= c;
    }
  }

  String get operatingHours {
    if (openHour == null || closeHour == null) {
      return 'Jam tidak tersedia';
    }
    return '$openHour - $closeHour';
  }

  DateTime? _parse(String hhmmOrHms) {
    final s = hhmmOrHms.split(':');
    if (s.length < 2) return null;
    final h = int.tryParse(s[0]);
    final m = int.tryParse(s[1]);
    final sec = s.length >= 3 ? int.tryParse(s[2]) ?? 0 : 0;
    if (h == null || m == null || h < 0 || h > 23 || m < 0 || m > 59) {
      return null;
    }
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, h, m, sec);
  }
}
