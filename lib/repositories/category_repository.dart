import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:expense_xpress/services/models/db.dart';
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
  Future<Category> create(Category item) {
    // TODO: implement create
    throw UnimplementedError();
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
        ),
        Category(
          id: uuid.v4(),
          name: S.current.clothing,
          image: AppIcons.iconClothing,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.entertainment,
          image: AppIcons.iconEntertainment,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.furniture,
          image: AppIcons.iconFurniture,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.shopping,
          image: AppIcons.iconShopping,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.personalItems,
          image: AppIcons.iconPersonalItem,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.transportation,
          image: AppIcons.iconTransport,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.household,
          image: AppIcons.iconHouse,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.travel,
          image: AppIcons.iconTravel,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.health,
          image: AppIcons.iconHealth,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.education,
          image: AppIcons.iconEducation,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.pet,
          image: AppIcons.iconPet,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.bills,
          image: AppIcons.iconBill,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.insurance,
          image: AppIcons.iconInsurance,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.investment,
          image: AppIcons.iconInvestment,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.houseHoldServices,
          image: AppIcons.iconHouseServices,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.houseHoldAppliances,
          image: AppIcons.iconHouseAppliance,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.beauty,
          image: AppIcons.iconBeauty,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.homeRepair,
          image: AppIcons.iconHomeRepair,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.rent,
          image: AppIcons.iconRent,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.otherExpense,
          image: AppIcons.iconOther,
          group: CategoryGroup.expense,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.salary,
          image: AppIcons.iconSalary,
          group: CategoryGroup.income,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.bonus,
          image: AppIcons.iconBonus,
          group: CategoryGroup.income,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.interestMoney,
          image: AppIcons.iconMoneyReceived,
          group: CategoryGroup.income,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.investment,
          image: AppIcons.iconInvestment,
          group: CategoryGroup.income,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.otherIncome,
          image: AppIcons.iconOtherIncome,
          group: CategoryGroup.income,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.borrowedMoney,
          image: AppIcons.iconBorrowed,
          group: CategoryGroup.deptAndLoan,
        ),
        Category(
          id: uuid.v4(),
          name: S.current.repayDebt,
          image: AppIcons.iconRepay,
          group: CategoryGroup.deptAndLoan,
        ),
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
    return querySnapshot.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Category>> getAllDefault() async {
    final QuerySnapshot querySnapshot =
        await _categories.doc('default').collection('categories').get();
    if (querySnapshot.docs.isEmpty) {
      await init();
      return getAllDefault();
    }
    return querySnapshot.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
