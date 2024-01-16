import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with MainScreenStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('History Screen'),
      ),
    );
  }

  @override
  void onPageVisible() {
    // TODO: implement onPageVisible
    MainScreen.of(context).params = AppBarParams(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
        ),
      ],
    );
  }
}
