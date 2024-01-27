import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/pages/profile/user_profile_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with MainScreenStateMixin {
  static const String _TAG = 'HomeScreen';
  late final GlobalKey<HomeScreenState> _key;
  late ImageProvider<Object> avatar;
  User? _user;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _key = GlobalKey<HomeScreenState>();
    avatar = UserService.getPhotoUrl(_user!);
  }

  // method when navigating to this page

  @override
  void onPageVisible() {
    print('$_TAG: onPageVisible');
    MainScreen.of(context).params = AppBarParams(
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
            child: GestureDetector(
              onTap: () {
                if (mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            UserProfileScreen(key: _key, user: _user),
                      )).then((value) => {
                        setState(() {
                          if (value != null && value is User) _user = value;
                          avatar = UserService.getPhotoUrl(_user!);
                        })
                      });
                }
              },
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
            ),
          )
        ]);
  }
}
