import 'package:expense_xpress/auth/onboarding_screen.dart';
import 'package:expense_xpress/auth/sign_in_screen.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/pages/select_language_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/widgets/global/animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({super.key});
  final bool isAuth = false;
  final bool isOnboarding = false;
  final bool isDarkMode = false;

  const SplashScreen({
    super.key,
    bool? isAuth,
    bool? isOnboarding,
    bool? isDarkMode,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuth = false;
  bool isOnboarding = false;
  bool isDarkMode = false;

  _redirectPage(context) {
    SharedPreferences.getInstance().then((prefs) async {
      var languageSelected = prefs.getString(Constants.language);
      if (languageSelected != null) {
        // handle logic here
        if (isAuth) {
          var user = await UserService.getCurrentUser();
          if (user != null) {
            // user is logged in
            // push to home screen
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return AppAnimate().fade(
                  child: MainScreen(
                user: user,
                initialIndex: 0,
              ));
            }));
          } else {
            // user is not logged in
            // push to sign in screen
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return AppAnimate().fade(child: const SignInScreen());
            }));
          }
        } else {
          if (isOnboarding) {
            // user actually see onboarding screen
          } else {
            // user not see onboarding screen yet
            // push to onboarding screen
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return AppAnimate().fade(child: const OnBoardingScreen());
            }));
          }
        }
      } else {
        // user not select language yet
        // push to select language screen
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return AppAnimate().fade(child: const LanguageSelectionScreen());
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).splashColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Animate(
              effects: const [
                FadeEffect(
                    duration: Duration(seconds: Constants.splashScreenDuration))
              ],
              child: SvgPicture.asset(
                ImagesAsset.logoSplash,
              ),
            )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    isAuth = widget.isAuth;
    isOnboarding = widget.isOnboarding;
    isDarkMode = widget.isDarkMode;

    // get pref
    SharedPreferences.getInstance().then((prefs) {
      isAuth = prefs.getBool(Constants.isAuth) ?? false;
      isOnboarding = prefs.getBool(Constants.isOnboarding) ?? false;
      isDarkMode = prefs.getBool(Constants.isDarkMode) ?? false;
      print('after get pref '
          'isAuth: $isAuth; isOnboarding: $isOnboarding; isDarkMode: $isDarkMode;');
    });
    print(
        'isAuth: $isAuth; isOnboarding: $isOnboarding; isDarkMode: $isDarkMode;');
    // print time to show splash screen
    print('Splash screen show up at ${DateTime.now()}');
    Future.delayed(const Duration(seconds: Constants.splashScreenDuration))
        .then((value) {
      print('Splash screen hide at ${DateTime.now()}');
      // check if user is select language for app
      _redirectPage(context);
    });
  }
}
