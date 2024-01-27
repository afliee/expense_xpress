import 'package:expense_xpress/repositories/category_repository.dart';
import 'package:expense_xpress/services/models/category.dart';

class CategoryService {
  static final CategoryRepository _categoryRepository = CategoryRepository();

  static Future<List<Category>> getAllDefault() async {
    return await _categoryRepository.getAllDefault();
  }

  static Future<List<Category>> getAll() async {
    return await _categoryRepository.getAll();
  }

  static Future<List<Category>> getAllByGroup(CategoryGroup group) async {
    return await _categoryRepository.getAllByGroup(group);
  }
}
