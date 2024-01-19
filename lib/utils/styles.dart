import 'package:expense_xpress/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppStyles {
  static const double padding = 16.0;
  static const double margin = 16.0;
  static const double buttonPadding = 16.0;
  static const double buttonBorderRadius = 12.0;
  static const double indicatorSelectedSize = 16.0;
  static const double textFieldHorizontalPadding = 16.0;
  static const double textFieldVerticalPadding = 20.0;
  static const double pinMargin = 4.0;
  static const double dividerIndent = 8.0;
  static const h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  static const h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  static const h3 = TextStyle(
    fontSize: 18.72,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  static const h4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  static const h5 = TextStyle(
    fontSize: 13.28,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  static const h6 = TextStyle(
    fontSize: 10.72,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.inter,
  );

  // date format with template date, Month year
  static DateFormat dateFormat = DateFormat('dd, MMM yyyy');
  static Widget sizedBoxSpace({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
