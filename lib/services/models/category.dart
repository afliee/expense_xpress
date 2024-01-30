enum CategoryGroup {
  expense,
  income,
  deptAndLoan;

  // create fromJson and toJson
  static CategoryGroup fromJson(String value) {
    switch (value) {
      case 'expense':
        return CategoryGroup.expense;
      case 'income':
        return CategoryGroup.income;
      case 'deptAndLoan':
        return CategoryGroup.deptAndLoan;
      default:
        return CategoryGroup.expense;
    }
  }

  String toJson() {
    switch (this) {
      case CategoryGroup.expense:
        return 'expense';
      case CategoryGroup.income:
        return 'income';
      case CategoryGroup.deptAndLoan:
        return 'deptAndLoan';
      default:
        return 'expense';
    }
  }

}
class Category {
  final String id;
  late String name;
  final String image;
  final CategoryGroup group;
  final String? description;
  late String? translatedName;
  late bool isDefault;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.group,
    this.description,
    this.translatedName,
    this.isDefault = false,
  });

  static Category fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      group: CategoryGroup.fromJson(json['group'] as String),
      description: json['description'] as String?,
      translatedName: json['translatedName'] as String?,
      isDefault: json['isDefault'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'group': group.toJson(),
      'description': description,
      'translatedName': translatedName,
      'isDefault': isDefault,
    };
  }
}