import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/home/history_screen.dart';
import 'package:expense_xpress/pages/home/home_screen.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  final User? user;

  const MainScreen({super.key, this.user, required this.initialIndex});

  @override
  State<MainScreen> createState() => MainScreenState();

  static MainScreenState of(BuildContext context) {
    return context.findAncestorStateOfType<MainScreenState>()!;
  }
}

class MainScreenState extends State<MainScreen> {
  late final Key? _key;
  AppBarParams? _appBarParams;

  late final PageController? _pageController;
  late int _currentIndex;
  User? _user;

  final List<GlobalKey<MainScreenStateMixin>> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  set params(AppBarParams? value) {
    setState(() {
      _appBarParams = value;
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    _onPageChanged(_currentIndex);
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    _keys[_currentIndex].currentState?.onPageVisible();
  }

  _initAppBar() {
    return AppBarParams();
  }

  _bottomNavBarPressed(int index) {
    // move to page with _pageController
    setState(() {
      _currentIndex = index;
    });
    _pageController?.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _keys[index].currentState?.onPageVisible();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: AppColors.primary,
          elevation: 2.0,
          child: const Icon(Icons.add, color: Colors.white, size: 24.0)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _appBarParams?.toAppBar,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomeScreen(
            key: _keys[0],
            user: _user,
          ),
          HistoryScreen(
            key: _keys[1],
          ),
          const Center(child: Text('Budget')),
          const Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: Constants.bottomNavBarHeight,
        child: BottomAppBar(
          color: Theme.of(context).colorScheme.background,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  iconSize: Constants.iconSize,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    animationDuration: const Duration(milliseconds: 300),
                  ),
                  alignment: Alignment.topCenter,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _bottomNavBarPressed(0);
                  },
                  icon: const Icon(Icons.home_rounded),
                  color: Theme.of(context).colorScheme.primary,
                  tooltip: S.of(context).home,
                  isSelected: _currentIndex == 0,
                  selectedIcon: Icon(Icons.home_rounded,
                      color: Theme.of(context).colorScheme.secondary)),
              IconButton(
                  iconSize: Constants.iconSize,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    animationDuration: const Duration(milliseconds: 300),
                  ),
                  alignment: Alignment.topCenter,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _bottomNavBarPressed(1);
                  },
                  icon: const Icon(Icons.account_balance_wallet_rounded),
                  color: Theme.of(context).colorScheme.primary,
                  tooltip: S.of(context).history,
                  isSelected: _currentIndex == 1,
                  selectedIcon: Icon(Icons.account_balance_wallet_rounded,
                      color: Theme.of(context).colorScheme.secondary)),
              IconButton(
                  iconSize: Constants.iconSize,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    animationDuration: const Duration(milliseconds: 300),
                  ),
                  alignment: Alignment.topCenter,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _bottomNavBarPressed(2);
                  },
                  icon: const Icon(Icons.account_balance_rounded),
                  color: Theme.of(context).colorScheme.primary,
                  tooltip: S.of(context).bugdet,
                  isSelected: _currentIndex == 2,
                  selectedIcon: Icon(Icons.account_balance_rounded,
                      color: Theme.of(context).colorScheme.secondary)),
              IconButton(
                  iconSize: Constants.iconSize,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    animationDuration: const Duration(milliseconds: 300),
                  ),
                  alignment: Alignment.topCenter,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _bottomNavBarPressed(3);
                  },
                  icon: const Icon(Icons.person_rounded),
                  tooltip: S.of(context).settings,
                  color: Theme.of(context).colorScheme.primary,
                  isSelected: _currentIndex == 3,
                  selectedIcon: Icon(Icons.person_rounded,
                      color: Theme.of(context).colorScheme.secondary))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _key = widget.key;
    _currentIndex = widget.initialIndex;
    _user = widget.user;
    _pageController = PageController(initialPage: _currentIndex);
    _appBarParams = _initAppBar();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _keys[0].currentState?.onPageVisible();
    });
  }
}
