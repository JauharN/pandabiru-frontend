import 'package:intl/intl.dart';

String formatIDR(num? value) {
  if (value == null) return '-';
  final f = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  return f.format(value);
}
