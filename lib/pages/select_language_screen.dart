import 'package:expense_xpress/auth/onboarding_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/lang/l10n.dart';
import 'package:expense_xpress/services/models/language.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/animate.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildUI(context, _selectedIndex, (index) {
      // on language changed
      setState(() {
        _selectedIndex = index;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      var languageSelected = prefs.getString(Constants.language);
      if (languageSelected != null) {
        // handle logic here
        if (languageSelected == 'en') {
          setState(() {
            _selectedIndex = 0;
          });
        } else if (languageSelected == 'vi') {
          setState(() {
            _selectedIndex = 1;
          });
        }
      }
    });
  }
}

Widget _buildLanguageItem(
    BuildContext context, Language language, bool isSelected, Function? onTap) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      onTap?.call();
    },
    child: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
          border: Border.all(
            color: isSelected
                ? AppColors.secondary
                : Theme.of(context).highlightColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.quaternary.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Row(children: <Widget>[
        SizedBox(
          child: Image.asset(language.flag),
        ),
        const SizedBox(width: 16),
        Expanded(
            child: RichText(
          text: TextSpan(
            text: language.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
            children: [
              TextSpan(
                text: ' (${language.code})',
                style: AppStyles.h4.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )),
        isSelected
            ? const Icon(
                Icons.check,
                color: AppColors.secondary,
              )
            : Container(),
      ]),
    ),
  );
}

// ui builder
Widget _buildUI(
    BuildContext context, int currentSelected, Function onLanguageChanged) {
  var _languages = Languages.all;
  final _languageProvider = Provider.of<LanguageProvider>(context);
  return Scaffold(
    // backgroundColor: Theme.of(context).colorScheme.background,
    appBar: AppBar(
        title: Text(
          S.of(context).language ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).appBarTheme.backgroundColor!,
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                return _buildLanguageItem(
                    context, _languages[index], currentSelected == index, () {
                  onLanguageChanged(index);
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(_languages[index].locale);
                });
              },
            ),
          ),
          // bottom button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Buttons.of(context).primary(
                child: Text(S.of(context).save ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setString(
                        Constants.language, _languages[currentSelected].code);
                    // Navigator.pop(context);
                    bool isAuth = prefs.getBool(Constants.isAuth) ?? false;
                    if (isAuth) {
                      // change language
                      _languageProvider
                          .setLocale(_languages[currentSelected].locale);

                      Navigator.pop(context);
                    } else {
                      // user not see onboarding screen yet
                      // push to onboarding screen
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AppAnimate()
                            .fade(child: const OnBoardingScreen());
                      }));
                    }
                  });
                }),
          )
        ],
      ),
    ),
  );
}
