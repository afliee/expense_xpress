import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/user/bs_profile_avatar.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/inputs.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  final User? user;

  const UserProfileScreen({super.key, required this.user});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late final TextEditingController _nameController, _credentialController;
  User? _user;

  _checkDataFromScreens() {
    var data = ModalRoute.of(context)?.settings.arguments as Map?;
    if (data != null) {
      if (data.containsKey(Constants.user)) {
        // _user = data[Constants.user];
        print('user: $_user');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkDataFromScreens();
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(S.of(context).profile,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(AppStyles.padding),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Center(
                      child: Stack(
                        // display profile image and edit icon
                        children: [
                          Container(
                            width: Constants.profileImageSize,
                            height: Constants.profileImageSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _getImageUrl(),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  if (mounted) {
                                    await BottomSheetChangeProfile.show(
                                        context, _user, (user) {
                                      setState(() {
                                        _user = user;
                                      });
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppStyles.sizedBoxSpace(height: 16),
                    Input.of(context).disabled(
                        label: S.of(context).credential,
                        controller: _credentialController),
                    AppStyles.sizedBoxSpace(height: 16),
                    Input.of(context).text(
                        label: S.of(context).displayName,
                        controller: _nameController),
                    Card(
                        elevation: 0,
                        // border card
                        color: Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        // remove padding of card
                        margin: const EdgeInsets.symmetric(
                            vertical: AppStyles.margin),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                S.of(context).joinDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              subtitle: Text(
                                AppStyles.dateFormat.format(
                                        _user?.createdAt ?? DateTime.now()) ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.onSurface,
                              height: 0,
                              thickness: 1,
                              indent: AppStyles.dividerIndent,
                              endIndent: AppStyles.dividerIndent,
                            ),
                            ListTile(
                              title: Text(
                                S.of(context).lastLogin,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              subtitle: Text(
                                AppStyles.dateFormat.format(
                                        _user?.lastLogin ?? DateTime.now()) ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              AppStyles.sizedBoxSpace(height: 16),
              SizedBox(
                width: double.infinity,
                child: Buttons.of(context).primary(
                    child: Text(
                      S.of(context).save,
                      style: AppStyles.h3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      AppDialogs.of(context).showLoadingDialog();
                      _user?.displayName = _nameController.text;

                      UserService.updateUser(_user!).then((value) {
                        AppDialogs.of(context).hideLoadingDialog();
                        Navigator.pop(context);
                      }).catchError((error) {
                        AppDialogs.of(context).hideLoadingDialog();
                        AppDialogs.of(context).showAlertDialog(
                          title: S.of(context).error,
                          message: error.toString(),
                          positiveText: S.of(context).ok,
                          onPositivePressed: () => Navigator.pop(context),
                        );
                      });
                    }),
              ),
            ],
          )),
    );
  }

  _getImageUrl() {
    switch (_user?.avatarType) {
      case AvatarType.google:
        return NetworkImage(_user?.photoUrl ?? '');
      case AvatarType.phone:
        return AssetImage(_user?.photoUrl ?? ImagesAsset.defaultAvatar);
      default:
        return AssetImage(_user?.photoUrl ?? ImagesAsset.defaultAvatar);
    }
  }

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _nameController = TextEditingController(text: _user?.displayName);
    switch (_user?.authType) {
      case AuthType.google:
        _credentialController = TextEditingController(text: _user?.mail);
        break;
      case AuthType.phone:
        _credentialController = TextEditingController(
            text: '${Constants.countryCode} ${_user?.phone}');
        break;
      default:
        _credentialController = TextEditingController(text: _user?.mail);
        break;
    }
  }
}
