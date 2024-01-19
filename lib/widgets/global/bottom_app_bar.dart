import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:flutter/material.dart';

class AppBottomAppBar extends StatefulWidget {
  final int? currentIndex;
  final Function? onTap;
  const AppBottomAppBar({super.key,required this.currentIndex,required this.onTap});

  @override
  State<AppBottomAppBar> createState() => _AppBottomAppBarState();

  void onSwipes(int index) {

  }
}

class _AppBottomAppBarState extends State<AppBottomAppBar> {
  int? _currentIndex;
  Function? _onTap;
  Function? _onSwipes;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.bottomNavBarHeight,
      child: BottomAppBar(
        color: AppColors.background,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                iconSize: Constants.iconSize,
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                alignment: Alignment.topCenter,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  _onTap!(0);
                },
                icon: const Icon(Icons.home_rounded),
                color: AppColors.primary,
                tooltip: S.of(context).home,
                isSelected: _currentIndex == 0,
                selectedIcon:
                    const Icon(Icons.home_rounded, color: AppColors.secondary)),
            IconButton(
                iconSize: Constants.iconSize,
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                alignment: Alignment.topCenter,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  _onTap!(1);
                },
                icon: const Icon(Icons.account_balance_wallet_rounded),
                color: AppColors.primary,
                tooltip: S.of(context).history,
                isSelected: _currentIndex == 1,
                selectedIcon: const Icon(Icons.account_balance_wallet_rounded,
                    color: AppColors.secondary)),
            IconButton(
                iconSize: Constants.iconSize,
                style: ButtonStyle(
                    overlayColor:
                    MaterialStateProperty.all(Colors.transparent)),
                alignment: Alignment.topCenter,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                  _onTap!(2);
                },
                icon: const Icon(Icons.account_balance_rounded),
                color: AppColors.primary,
                tooltip: S.of(context).bugdet,
                isSelected: _currentIndex == 2,
                selectedIcon: const Icon(Icons.account_balance_rounded,
                    color: AppColors.secondary)),
            IconButton(
                iconSize: Constants.iconSize,
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                alignment: Alignment.topCenter,
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                  _onTap!(3);
                },
                icon: const Icon(Icons.person_rounded),
                tooltip: S.of(context).settings,
                color: AppColors.primary,
                isSelected: _currentIndex == 3,
                selectedIcon: const Icon(Icons.person_rounded,
                    color: AppColors.secondary))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _onTap = widget.onTap;
    _onSwipes = _onSwipes;
  }
}
