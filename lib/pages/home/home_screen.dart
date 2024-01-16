import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
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
  // custom bottom navbar height base on height of FAB
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
    if (_user!.photoUrl.isNotEmpty) {
      avatar = NetworkImage(_user!.photoUrl);
    } else {
      avatar = AssetImage(ImagesAsset.defaultAvatar);
    }
  }

  @override
  void onPageVisible() {
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
}
