import 'package:expense_xpress/auth/splash_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/lang/l10n.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isAuth = false;
    bool isOnboarding = false;
    bool isDarkMode = false;
    bool isFirstTime = false;
    // get pref
    SharedPreferences.getInstance().then((prefs) {
      isAuth = prefs.getBool(Constants.isAuth) ?? false;
      isOnboarding = prefs.getBool(Constants.isOnboarding) ?? false;
      isDarkMode = prefs.getBool(Constants.isDarkMode) ?? false;
      isFirstTime = prefs.getBool(Constants.isFirstTime) ?? false;
    });
    // hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Expense Xpress',
            theme: ThemeData(
              fontFamily: 'Inter',
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: provider.locale,
            supportedLocales: Languages.allLocale,
            home: SplashScreen(
              isAuth: isAuth,
              isOnboarding: isOnboarding,
              isDarkMode: isDarkMode,
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
