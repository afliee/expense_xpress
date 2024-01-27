import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:flutter/cupertino.dart';

class DefaultCategories {
  List<Category> _categories = [];
  late final BuildContext _context;

  static final DefaultCategories _instance = DefaultCategories._internal();

  factory DefaultCategories(BuildContext context) {
    _instance._context = context;
    return _instance;
  }

  DefaultCategories._internal();

  static DefaultCategories from(List<Category> categories) {
    _instance._categories = categories;
    return _instance;
  }

  List<Category> transform() {
    _categories.forEach((category) {
      // category.translatedName = S.of(_context).categoryName(category.name);
    });
    return _categories;
  }


}