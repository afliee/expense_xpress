import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppStyles {
  static const double padding = 16.0;
  static const double margin = 16.0;
  static const double radius = 12.0;
  static const double iconSize = 24.0;
  static const double shadowBlurRadius = 12.0;
  static const double shadowSpreadRadius = 0.0;
  static const double buttonPadding = 16.0;
  static const double buttonBorderRadius = 12.0;
  static const double indicatorSelectedSize = 16.0;
  static const double textFieldHorizontalPadding = 16.0;
  static const double textFieldVerticalPadding = 20.0;
  static const double avatarSize = 100.0;
  static const double pinMargin = 4.0;
  static const double dividerIndent = 8.0;
  static const double h1FontSize = 32.0;
  static const double h2FontSize = 24.0;
  static const double h4FontSize = 16.0;
  static const double h5FontSize = 13.28;
  static const double h6FontSize = 10.72;

  static const double bodyLargeFontSize = 16.0;
  static const double bodyMediumFontSize = 13.28;
  static const double bodySmallFontSize = 10.72;

  static const double titleMediumFontSize = 16.0;
  static const double titleSmallFontSize = 13.28;

  static const double labelFontSize = 13.28;
  static const double captionFontSize = 10.72;
  static const double overlineFontSize = 10.72;
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

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      // background: AppColors.lightModeBackground,
    ),
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: Colors.teal,
    //   brightness: Brightness.light,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.background,
    splashColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.darkModePrimary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.darkModePrimary,
      // background: AppColors.darkModeBackground,
      // onBackground: AppColors.darkModeOnBackground,
    ),
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: Colors.teal,
    //   brightness: Brightness.dark,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    splashColor: Colors.transparent,
  );
}
