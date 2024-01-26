import 'package:expense_xpress/auth/splash_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/lang/l10n.dart';
import 'package:expense_xpress/services/providers/display_provider.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // init firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAuth = false;
  bool _isOnboarding = false;
  bool _isDarkMode = false;
  bool _isFirstTime = false;

  @override
  Widget build(BuildContext context) {
    // get pref
    // hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => DisplayProvider())
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, provider, child) {
          final displayProvider = Provider.of<DisplayProvider>(context);

          return MaterialApp(
            title: 'Expense Xpress',
            // theme: ThemeData(
            //   fontFamily: 'Inter',
            //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            //   useMaterial3: true,
            // ),
            theme: AppStyles.lightTheme,
            darkTheme: AppStyles.darkTheme,
            themeMode: displayProvider.themeMode,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: provider.locale,
            supportedLocales: Languages.allLocale,
            home: SplashScreen(
              isAuth: _isAuth,
              isOnboarding: _isOnboarding,
              isDarkMode: _isDarkMode,
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      _isAuth = prefs.getBool(Constants.isAuth) ?? false;
      _isOnboarding = prefs.getBool(Constants.isOnboarding) ?? false;
      _isDarkMode = prefs.getBool(Constants.isDarkMode) ?? false;
      _isFirstTime = prefs.getBool(Constants.isFirstTime) ?? false;
    });
  }
}
