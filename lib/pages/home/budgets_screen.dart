import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/budgets/create_budget_screen.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/budget.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/loading/budgets_loading.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> with MainScreenStateMixin {
  static const String _TAG = 'BudgetScreen';
  late DateTime _currentMonth;
  BudgetOption _currentBudgetPicked = BudgetOption.weekly;
  var _budgets = <Budget>[];

  // late
  late final User user;
  bool _isUserLoaded = false;

  @override
  void initState() {
    super.initState();
    UserService.getCurrentUser().then((user) {
      setState(() {
        _isUserLoaded = true;
        user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isUserLoaded
          ? SingleChildScrollView(
              child: Column(
                  // match parent width
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // segment control slider for top
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: AppStyles.margin / 2,
                        horizontal: AppStyles.margin / 2,
                      ),
                      child: CupertinoSlidingSegmentedControl(
                          groupValue: _currentBudgetPicked,
                          children: {
                            BudgetOption.weekly: Text(S.of(context).weekly),
                            BudgetOption.monthly: Text(S.of(context).monthly),
                            BudgetOption.yearly: Text(S.of(context).yearly)
                          },
                          onValueChanged: (budgetOptionChanged) {
                            // get budgets based on selected option
                            _getBudgets(budgetOptionChanged);
                          }),
                    ),
                    _buildBudgetList(),
                  ]),
            )
          : BudgetLoading.build(context).animate().fade(),
    );
  }

  @override
  void onPageVisible() {
    debugPrint('$_TAG: onPageVisible');
    MainScreen.of(context).params = AppBarParams(
        title: Text(S.of(context).budgets,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                )),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: AppStyles.margin),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  // navigate to create budget screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateBudgetScreen()),
                  ).then((value) => _getBudgets(null));
                },
                label: Text(
                  S.of(context).newBudget,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                )),
          ),
        ],
        centerTitle: false);
  }

  _getBudgets(BudgetOption? budgetOptionChanged) async {
    // TODO: implement _getBudgets
    print('${_TAG}: _getBudgets');
    var budgets = <Budget>[];
    setState(() {
      _budgets = budgets;
      _currentBudgetPicked = budgetOptionChanged ?? BudgetOption.weekly;
    });
  }

  _buildBudgetList() {
    if (_budgets.isEmpty) {
      return Container(
        child: Column(
          children: [
            Image.asset(
              ImagesAsset.emptyState,
              // width: 200,
              // height: 200,
            ),
            Text(
              S.of(context).noData,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600),
            ),
            AppStyles.sizedBoxSpace(height: AppStyles.margin / 2),
            Text(
              S.of(context).letStartByCreatingNewBudget,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
  }
}
