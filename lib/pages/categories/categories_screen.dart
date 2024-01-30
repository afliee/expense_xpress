import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/categories/create_category_screen.dart';
import 'package:expense_xpress/services/extension/string_extension.dart';
import 'package:expense_xpress/services/functions/category_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/default_categories/bs_create_category.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final User user;
  CategoryGroup _categoryGroup = CategoryGroup.expense;
  List<Category> _categories = [];
  List<Category> _categoriesOfUser = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          S.of(context).categories,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        // match_parent width
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoSlidingSegmentedControl(
              children: {
                0: Text(
                  S.of(context).expense,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600),
                ),
                1: Text(
                  S.of(context).income,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600),
                ),
                2: Text(
                  S.of(context).debtAndLoan,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600),
                ),
              },
              groupValue: _categoryGroup.index,
              onValueChanged: (valueSelected) {
                _categoryGroup = CategoryGroup.values[valueSelected as int];
                _getCategories();
              }),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: AppStyles.padding, horizontal: AppStyles.margin / 2),
            child: Buttons.of(context).primaryWithIcon(
                child: Text(
                  S.of(context).addNewCategory,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => const CreateCategoryScreen(),
                    ),
                  )
                      .then((value) {
                    _getCategories();
                  });
                },
                icon: Icon(Icons.add_circle_outline_rounded,
                    color: Theme.of(context).colorScheme.onPrimary)),
          ),
          Expanded(
            child: _categories.isNotEmpty
                ? ListView.builder(
                    itemCount: _categories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Category category = _categories[index];
                      return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppStyles.padding / 2,
                              horizontal: AppStyles.margin),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius:
                                  BorderRadius.circular(AppStyles.radius),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .shadow
                                        .withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: const Offset(0, 3))
                              ]),
                          child: category.isDefault
                              ? ListTile(
                                  leading: SizedBox(
                                    width: 40,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage(category.image),
                                    ),
                                  ),
                                  title: Text(
                                    // translate category name
                                    category.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            fontWeight: FontWeight.w600),
                                  ),
                                )
                              : _buildPersonalCategories(context, category));
                    },
                  ).animate().fade()
                : const Loading(),
          )
        ],
      )),
    );
  }

  _getCategories() async {
    List<Category> categories =
        await CategoryService.getAllByGroup(_categoryGroup);
    _categories = categories;
    await _getCategoriesOfUser();
  }

  _getCategoriesOfUser() async {
    List<Category> categories =
        await CategoryService.getAllByGroupOfUser(_categoryGroup, user.uid);

    // check if categories not empty then add to default category list with first position
    if (_categories.isNotEmpty) {
      setState(() {
        _categories.insertAll(0, categories);
      });
    } else {
      setState(() {
        _categories = categories;
      });
    }
  }

  _buildPersonalCategories(context, category) {
    return GestureDetector(
      onLongPress: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
                  cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        S.of(context).cancel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      )),
                  title: Text(
                    S.of(context).chooseActionFor(category.name),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => CreateCategoryScreen(
                                        category: category,
                                      )))
                              .then((value) async {
                            await _getCategories();
                          });
                        },
                        isDefaultAction: true,
                        child: Text(
                          S.of(context).edit,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500),
                        )),
                    CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.of(_scaffoldKey.currentContext!).pop();
                          AppDialogs.of(_scaffoldKey.currentContext)
                              .showAlertDialog(
                                  title: S
                                      .of(_scaffoldKey.currentContext!)
                                      .deleteCategory,
                                  message: S
                                      .of(_scaffoldKey.currentContext!)
                                      .deleteCategoryMessage,
                                  positiveText:
                                      S.of(_scaffoldKey.currentContext!).delete,
                                  negativeText:
                                      S.of(_scaffoldKey.currentContext!).cancel,
                                  onPositivePressed: () async {
                                    Navigator.of(_scaffoldKey.currentContext!)
                                        .pop();
                                    await CategoryService.delete(
                                            category, user.uid)
                                        .then((value) {
                                      if (value != null) {
                                        AppDialogs.of(
                                                _scaffoldKey.currentContext!)
                                            .showAlertDialog(
                                                title: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .success,
                                                message: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .deleteCategoryMessage,
                                                positiveText: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .ok,
                                                onPositivePressed: () {
                                                  Navigator.of(_scaffoldKey
                                                          .currentContext!)
                                                      .pop();
                                                  _getCategories();
                                                });
                                      } else {
                                        AppDialogs.of(
                                                _scaffoldKey.currentContext!)
                                            .showAlertDialog(
                                                title: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .error,
                                                message: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .somethingWentWrongInProcess,
                                                positiveText: S
                                                    .of(_scaffoldKey
                                                        .currentContext!)
                                                    .ok,
                                                onPositivePressed: () {
                                                  Navigator.of(_scaffoldKey
                                                          .currentContext!)
                                                      .pop();
                                                });
                                      }
                                    });
                                  },
                                  onNegativePressed: () {
                                    Navigator.of(_scaffoldKey.currentContext!)
                                        .pop();
                                  });
                        },
                        child: Text(
                          S.of(context).delete,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  fontWeight: FontWeight.w500),
                        )),
                  ],
                ));
      },
      child: ListTile(
        leading: SizedBox(
          width: 40,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(category.image),
          ),
        ),
        title: Text(
          // translate category name
          category.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    UserService.getCurrentUser().then((value) {
      user = value;
      _getCategoriesOfUser();
    });
    CategoryService.getAllByGroup(_categoryGroup).then((categories) {
      print(categories.length);

      setState(() {
        _categories = categories;
      });
    }).catchError((error) {
      print(error);
      AppDialogs.of(context).showAlertDialog(
          title: S.of(context).error,
          message: error.toString(),
          positiveText: S.of(context).ok,
          onPositivePressed: () {
            Navigator.of(context).pop();
          });
    });
  }
}
