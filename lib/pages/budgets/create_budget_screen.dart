import 'package:expense_xpress/generated/l10n.dart';
import 'package:flutter/material.dart';

class CreateBudgetScreen extends StatefulWidget {
  const CreateBudgetScreen({super.key});

  @override
  State<CreateBudgetScreen> createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      title: Text(
        S.of(context).newWallet,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ),
      ),
    ));
  }
}
