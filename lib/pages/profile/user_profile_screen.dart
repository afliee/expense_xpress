import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
            style: AppStyles.h3.copyWith(
              fontWeight: FontWeight.w600,
            )),
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () {},
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
                        color: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: AppColors.textFieldsColor,
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
                                style: AppStyles.h4.copyWith(
                                  color: AppColors.textFieldsColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                AppStyles.dateFormat.format(
                                        _user?.createdAt ?? DateTime.now()) ??
                                    '',
                                style: AppStyles.h4.copyWith(
                                  color: AppColors.textFieldsColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Divider(
                              color: AppColors.textFieldsHintColor,
                              height: 0,
                              thickness: 1,
                              indent: AppStyles.dividerIndent,
                              endIndent: AppStyles.dividerIndent,
                            ),
                            ListTile(
                              title: Text(
                                S.of(context).lastLogin,
                                style: AppStyles.h4.copyWith(
                                  color: AppColors.textFieldsColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                AppStyles.dateFormat.format(
                                        _user?.lastLogin ?? DateTime.now()) ??
                                    '',
                                style: AppStyles.h4.copyWith(
                                  color: AppColors.textFieldsColor,
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
                child: Buttons.primary(
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
                          onPositivePressed:  () => Navigator.pop(context),
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
        _credentialController = TextEditingController(text: '${Constants.countryCode} ${_user?.phone}');
        break;
      default:
        _credentialController = TextEditingController(text: _user?.mail);
        break;
    }
  }
}
