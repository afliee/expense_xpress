import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/category_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/category.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/icons.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/inputs.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:uuid/uuid.dart';

class CreateCategoryScreen extends StatefulWidget {
  final Category? category;
  const CreateCategoryScreen({super.key, this.category});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  Category? _category;
  static final String _TAG = '_CreateCategoryScreenState';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _categoryNameController;
  late final TextEditingController _categoryGroupController =
      TextEditingController(text: S.current.categoryGroup);
  late CategoryGroup _categoryGroup;
  String _categoryIcon = AppIcons.iconSalary;
  late final User user;
  bool _isUserLoaded = false;

  @override
  void initState() {
    super.initState();
    _category = widget.category;
    _categoryNameController =
        TextEditingController(text: _category?.name ?? '');
    _categoryGroup = _category?.group ?? CategoryGroup.expense;
    UserService.getCurrentUser().then((user) {
      setState(() {
        this.user = user;
        _isUserLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).addNewCategory,
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
        body: _isUserLoaded
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppStyles.padding),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: AppStyles.padding),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _buildBottomSheetCategoryIcon(context);
                            },
                            child: SizedBox(
                              height: 64,
                              width: 64,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(_categoryIcon),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Tooltip(
                              message: S.of(context).yourCanPickIcon,
                              child: Icon(Icons.info,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: AppStyles.padding),
                      Input.of(context).text(
                          label: S.of(context).categoryName,
                          controller: _categoryNameController),
                      const SizedBox(height: AppStyles.padding),
                      SizedBox(
                        // create context menu for category group
                        child: Input.of(context).select(
                          label: S.of(context).categoryGroup,
                          controller: _categoryGroupController,
                          value: _categoryGroup.name,
                          items: [
                            DropdownMenuItem<String>(
                              child: Text(S.of(context).expense),
                              value: CategoryGroup.expense.name,
                            ),
                            DropdownMenuItem<String>(
                              child: Text(S.of(context).income),
                              value: CategoryGroup.income.name,
                            ),
                            DropdownMenuItem<String>(
                              child: Text(S.of(context).debtAndLoan),
                              value: CategoryGroup.deptAndLoan.name,
                            ),
                          ],
                          onChanged: (value) {
                            print('$_TAG: value: $value');
                            _categoryGroup = CategoryGroup.fromJson(value);
                            print(
                                '$_TAG: category group: ${_categoryGroup.name}');
                          },
                        ),
                      ),
                      const SizedBox(height: AppStyles.padding),
                      SizedBox(
                        width: double.infinity,
                        child: Buttons.of(context).primary(
                          child: Text(
                            S.of(context).save,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_category == null) {
                                _createCategory(context);
                              } else {
                                // update category
                                AppDialogs.of(context).showLoadingDialog();
                                CategoryService.update(
                                        Category(
                                          id: _category!.id,
                                          name:
                                              _categoryNameController.text.trim(),
                                          group: _categoryGroup,
                                          image: _categoryIcon,
                                          isDefault: false,
                                        ),
                                        user.uid!)
                                    .then((category) {
                                  AppDialogs.of(context).hideLoadingDialog();
                                  Navigator.of(context).pop(category);
                                });
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ).animate().fade()
            : const Loading());
  }

  _createCategory(context) async {
    AppDialogs.of(context).showActionDialog(
      title: S.of(context).confirm,
      message: S.of(context).areYouSureToContinue,
      positiveText: S.of(context).ok,
      onPositivePressed: () async {
        AppDialogs.of(context).showLoadingDialog();
        try {
          final category = await CategoryService.create(Category(
            id: const Uuid().v4(),
            name: _categoryNameController.text.trim(),
            group: _categoryGroup,
            image: _categoryIcon,
            isDefault: false,
          ));

          AppDialogs.of(context).hideLoadingDialog();
          Navigator.of(context).pop();
          AppDialogs.of(context).showSnackBar(
              message: S.of(context).createCategorySuccess,
              actionText: S.of(context).view,
              onActionPressed: () {
                Navigator.of(context).pop(category);
              });
        } catch (e) {
          AppDialogs.of(context).hideLoadingDialog();
          Navigator.of(context).pop();
          AppDialogs.of(context).showSnackBar(
              message: S.of(context).createCategoryFailed,
              actionText: S.of(context).tryAgain,
              onActionPressed: () {
                Navigator.of(context).pop();
              });
        }
      },
      negativeText: S.of(context).cancel,
      onNegativePressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  _buildBottomSheetCategoryIcon(context) async {
    final categoriesDefault = await CategoryService.getAllDefault();
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.bottomSheetBorderRadius),
            topRight: Radius.circular(AppStyles.bottomSheetBorderRadius),
          ),
        ),
        context: context,
        builder: (context) {
          // return grid view with 3 column
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: AppStyles.padding / 2),
            child: GridView.builder(
              itemCount: categoriesDefault.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      // set category icon
                      setState(() {
                        _categoryIcon = categoriesDefault[index].image;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        margin: const EdgeInsets.all(AppStyles.margin / 2),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage(categoriesDefault[index].image),
                        )));
              },
            ),
          );
        });
  }
}
