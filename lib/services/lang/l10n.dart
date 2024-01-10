import 'package:expense_xpress/services/models/language.dart';
import 'package:expense_xpress/utils/icons.dart';

class Languages {
  static const defaultLanguage = Language(
    code: 'en',
    name: 'English',
    flag: '🇺🇸',
  );

  static final all = [
    const Language(
      code: 'en',
      name: 'English',
      flag: AppIcons.iconEnLang,
    ),
    const Language(
      code: 'vi',
      name: 'Tiếng Việt',
      flag: AppIcons.iconViLang,
    ),
  ];

  static final allLocale = all.map((e) => e.locale).toList();
}