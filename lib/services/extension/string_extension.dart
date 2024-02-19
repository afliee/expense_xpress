import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toVNDCurrency() {
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(double.parse(this));
  }

  num toNum() {
    return num.parse(this);
  }

  // format from currency to number ex: 1.000 ₫ -> 1000
  num currencyToNum() {
    if (isEmpty) {
      return 0;
    }
    return num.parse(replaceAll(RegExp(r'[^0-9]'), ''));
  }

  double currencyToDouble() {
    // check if the string is empty
    if (isEmpty) {
      return 0;
    }
    return double.parse(replaceAll(RegExp(r'[^0-9]'), ''));
  }
}
