import 'dart:async';

import 'package:expense_xpress/repositories/category_repository.dart';
import 'package:expense_xpress/services/models/category.dart';

class CategoryService {
  static final CategoryRepository _categoryRepository = CategoryRepository();

  static Future<Category> create(Category category) async {
    return await _categoryRepository.create(category);
  }

  static Future<List<Category>> getAllDefault() async {
    return await _categoryRepository.getAllDefault();
  }

  static Future<List<Category>> getAll() async {
    return await _categoryRepository.getAll();
  }

  static Future<List<Category>> getAllByGroup(CategoryGroup group) async {
    return await _categoryRepository.getAllByGroup(group);
  }

  static Future<List<Category>> getAllByGroupOfUser(
      CategoryGroup group, String userId) async {
    return await _categoryRepository.getAllByGroupOfUser(group, userId);
  }

  static Future<Category?> update(Category category, String userId) async {
    try {
      return await _categoryRepository.updateWithUserId(category, userId);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Category?> delete(Category category, String userId) async {
    try {
      return await _categoryRepository.deleteWithUserId(category, userId);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
