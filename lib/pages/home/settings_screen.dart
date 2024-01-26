import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/providers/display_provider.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/settings/setting_tile.dart';
import 'package:expense_xpress/widgets/features/settings/settings.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with MainScreenStateMixin {
  static const String _TAG = 'SettingsScreen';
  final GlobalKey<_SettingsScreenState> _key =
      GlobalKey<_SettingsScreenState>();
  bool _isUserLoaded = false;
  late int _displaySelected;
  late final User user;

  @override
  Widget build(BuildContext context) {
    final displayProvider = Provider.of<DisplayProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _isUserLoaded
            ? ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppStyles.padding),
                          width: AppStyles.avatarSize,
                          height: AppStyles.avatarSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 3), // changes positithì on of shadow
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage: UserService.getPhotoUrl(user),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('$_TAG: $exception');
                              print('$_TAG: $stackTrace');
                            },
                          ),
                        ),
                        Text(
                          user.displayName.toUpperCase() ??
                              S.of(context).unKnown,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.w600),
                        ),
                        AppStyles.sizedBoxSpace(height: 8),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          indent: AppStyles.dividerIndent,
                          endIndent: AppStyles.dividerIndent,
                        ),
                      ]),
                    ],
                  ),
                  AppStyles.sizedBoxSpace(height: AppStyles.padding),
                  _buildSettingOptions(
                      context, {'displayProvider': displayProvider})
                ],
              ).animate().fade()
            : const Loading(),
      ),
    );
  }

  @override
  void onPageVisible() {
    // TODO: implement onPageVisible
    print('$_TAG: onPageVisible');
    MainScreen.of(context).params = AppBarParams(
      title: Text(
        S.of(context).profileSettings,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // get themeMode from provider
    _displaySelected = DisplayProvider.themeModeToInt(
        Provider.of<DisplayProvider>(context, listen: false).themeMode);
    // call furture method to get user
    UserService.getCurrentUser().then((value) => {
          setState(() {
            user = value;
            _isUserLoaded = true;
          })
        });
  }

  _buildSettingOptions(BuildContext context, options) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.padding),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).personal,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            ...SettingsGroup.of(context)
                .settings[S.of(context).personal]!
                .map((option) => SettingTile(
                      option: option,
                    ))
                .toList(),
            AppStyles.sizedBoxSpace(height: AppStyles.padding),
            Text(
              S.of(context).display,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            AppStyles.sizedBoxSpace(height: AppStyles.padding / 2),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Text(S.of(context).light),
                    1: Text(S.of(context).dark),
                    2: Text(S.of(context).system),
                  },
                  padding: const EdgeInsets.all(0),
                  groupValue: _displaySelected,
                  onValueChanged: (valueSelected) {
                    setState(() {
                      _displaySelected = valueSelected ?? 2;
                      switch (valueSelected) {
                        case 0:
                          {
                            options['displayProvider'].themeMode =
                                ThemeMode.light;
                            break;
                          }
                        case 1:
                          {
                            options['displayProvider'].themeMode =
                                ThemeMode.dark;
                            break;
                          }
                        default:
                          options['displayProvider'].themeMode =
                              ThemeMode.system;
                      }
                    });
                  }),
            ),
            ...SettingsGroup.of(context)
                .settings[S.of(context).display]!
                .map((option) => SettingTile(
                      option: option,
                    ))
                .toList(),
          ]),
    );
  }
}
