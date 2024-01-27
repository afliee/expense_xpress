import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/category_service.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/styles.dart';
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
  CategoryGroup _categoryGroup = CategoryGroup.expense;
  List<Category> _categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
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
    setState(() {
      _categories = categories;
    });
  }

  @override
  void initState() {
    super.initState();
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
