import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toVNDCurrency() {
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(double.parse(this));
  }
}
