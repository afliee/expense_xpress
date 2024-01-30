import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:expense_xpress/services/models/db.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CategoryRepository extends Repository<Category, String> {
  static final CategoryRepository _instance = CategoryRepository._internal();

  factory CategoryRepository() {
    return _instance;
  }

  CategoryRepository._internal();

  static final CollectionReference _categories = DB.categories;

  @override
  Future<Category> create(Category item) async {
    // TODO: implement create
    final User user = await UserService.getCurrentUser();
    final CollectionReference userCategories =
        _categories.doc(user.uid).collection('categories');

    // check if category already exists with same name
    final QuerySnapshot querySnapshot = await userCategories
        .where('name', isEqualTo: item.name)
        .where('group', isEqualTo: item.group.name)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      throw Exception(S.current.categoryAlreadyExists);
    }

    //   save category
    final DocumentReference documentReference = userCategories.doc(item.id);
    await documentReference.set(item.toJson());
    return item;
  }

  @override
  Future<Category> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Category> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Category> update(Category item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<Category> updateWithUserId(Category category, String userId) async {
    final CollectionReference userCategories =
        _categories.doc(userId).collection('categories');

    // check if category already exists with same name
    final QuerySnapshot querySnapshot = await userCategories
        .where('name', isEqualTo: category.name)
        .where('group', isEqualTo: category.group.name)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      throw Exception(S.current.categoryAlreadyExists);
    }

    //   save category
    final DocumentReference documentReference = userCategories.doc(category.id);
    await documentReference.set(category.toJson());
    return category;
  }

  Future<Category> deleteWithUserId(Category category, String userId) async {
    final CollectionReference userCategories =
        _categories.doc(userId).collection('categories');

    final DocumentReference documentReference = userCategories.doc(category.id);
    await documentReference.delete();
    return category;
  }

  Future<void> init() async {
    String locale = await SharedPreferences.getInstance()
        .then((value) => value.getString(Constants.language) ?? 'en');
    const Uuid uuid = Uuid();
    final CollectionReference defaultCategories =
        _categories.doc('default-$locale').collection('categories');
    // check if default categories exists
    final QuerySnapshot querySnapshot = await defaultCategories.get();
    if (querySnapshot.docs.isEmpty) {
      List<Category> categories = [
        Category(
            id: uuid.v4(),
            name: S.current.food,
            image: AppIcons.iconFood,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.clothing,
            image: AppIcons.iconClothing,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.entertainment,
            image: AppIcons.iconEntertainment,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.furniture,
            image: AppIcons.iconFurniture,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.shopping,
            image: AppIcons.iconShopping,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.personalItems,
            image: AppIcons.iconPersonalItem,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.transportation,
            image: AppIcons.iconTransport,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.household,
            image: AppIcons.iconHouse,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.travel,
            image: AppIcons.iconTravel,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.health,
            image: AppIcons.iconHealth,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.education,
            image: AppIcons.iconEducation,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.pet,
            image: AppIcons.iconPet,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.bills,
            image: AppIcons.iconBill,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.insurance,
            image: AppIcons.iconInsurance,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.investment,
            image: AppIcons.iconInvestment,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.houseHoldServices,
            image: AppIcons.iconHouseServices,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.houseHoldAppliances,
            image: AppIcons.iconHouseAppliance,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.beauty,
            image: AppIcons.iconBeauty,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.homeRepair,
            image: AppIcons.iconHomeRepair,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.rent,
            image: AppIcons.iconRent,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.otherExpense,
            image: AppIcons.iconOther,
            group: CategoryGroup.expense,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.salary,
            image: AppIcons.iconSalary,
            group: CategoryGroup.income,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.bonus,
            image: AppIcons.iconBonus,
            group: CategoryGroup.income,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.interestMoney,
            image: AppIcons.iconMoneyReceived,
            group: CategoryGroup.income,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.investment,
            image: AppIcons.iconInvestment,
            group: CategoryGroup.income,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.otherIncome,
            image: AppIcons.iconOtherIncome,
            group: CategoryGroup.income,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.borrowedMoney,
            image: AppIcons.iconBorrowed,
            group: CategoryGroup.deptAndLoan,
            isDefault: true),
        Category(
            id: uuid.v4(),
            name: S.current.repayDebt,
            image: AppIcons.iconRepay,
            group: CategoryGroup.deptAndLoan,
            isDefault: true),
      ];

      for (var category in categories) {
        await defaultCategories.doc(category.id).set(category.toJson());
      }
    }
  }

  Future<List<Category>> getAllByGroup(CategoryGroup group) async {
    String locale = await SharedPreferences.getInstance()
        .then((value) => value.getString(Constants.language) ?? 'en');

    final QuerySnapshot querySnapshot = await _categories
        .doc('default-$locale')
        .collection('categories')
        .where('group', isEqualTo: group.name)
        .get();
    if (querySnapshot.docs.isEmpty) {
      await init();
      return getAllByGroup(group);
    }
    // return list of categories ordered by name
    return querySnapshot.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<List<Category>> getAllByGroupOfUser(
      CategoryGroup group, String userId) async {
    final CollectionReference userCategories =
        _categories.doc(userId).collection('categories');

    // return empty list if user has no categories
    final QuerySnapshot querySnapshot =
        await userCategories.where('group', isEqualTo: group.name).get();

    if (querySnapshot.docs.isEmpty) {
      return [];
    } else {
      // return list of categories ordered by name
      return querySnapshot.docs
          .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name));
    }
  }

  Future<List<Category>> getAllDefault() async {
    String locale = await SharedPreferences.getInstance()
        .then((value) => value.getString(Constants.language) ?? 'en');
    final QuerySnapshot querySnapshot =
        await _categories.doc('default-$locale').collection('categories').get();
    if (querySnapshot.docs.isEmpty) {
      await init();
      return getAllDefault();
    }
    return querySnapshot.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }
}
