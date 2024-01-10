import 'package:expense_xpress/services/lang/l10n.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Languages.defaultLanguage.locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!Languages.all.contains(locale)) {
      return;
    }
    _locale = locale;
    notifyListeners();
  }
}