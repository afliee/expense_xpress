import 'package:expense_xpress/pages/home/history_screen.dart';
import 'package:expense_xpress/pages/home/home_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:expense_xpress/widgets/global/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final User? user;

  const MainScreen({super.key, this.user});

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
  late ImageProvider<Object> avatar;
  int _currentIndex = 0;
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
    return AppBarParams(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          // avatar
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: avatar is NetworkImage
                    ? Border.all(color: Colors.transparent, width: 0)
                    : Border.all(color: Colors.white, width: 1)),
            // if user has no photoUrl then show default avatar in assets folder or use a network image
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: avatar,
              onBackgroundImageError: (exception, stackTrace) {
                print('Error: $exception');
                setState(() {
                  avatar = AssetImage(ImagesAsset.defaultAvatar);
                });
              },
            ),
          )
        ]);
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
      backgroundColor: AppColors.background,
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
      bottomNavigationBar: AppBottomAppBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController!.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _key = widget.key;
    _user = widget.user;
    _pageController = PageController(initialPage: _currentIndex);
    if (_user!.photoUrl.isNotEmpty) {
      avatar = NetworkImage(_user!.photoUrl);
    } else {
      avatar = AssetImage(ImagesAsset.defaultAvatar);
    }
    _appBarParams = _initAppBar();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _keys[0].currentState?.onPageVisible();
    });
  }
}


