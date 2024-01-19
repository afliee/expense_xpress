import 'package:expense_xpress/auth/code_sending.dart';
import 'package:expense_xpress/auth/sign_up_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/functions/auth_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart' as UserModel;
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/icons.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/inputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  final bool? isFromOnBoarding;

  const SignInScreen({super.key, this.isFromOnBoarding});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFromOnBoarding = false;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _isFromOnBoarding = widget.isFromOnBoarding ?? false;
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        // if isfromonboarding is true then show back button
        leading: _isFromOnBoarding
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
        title: Text(S.of(context).signIn,
            style: AppStyles.h3.copyWith(
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(AppStyles.padding),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    Input.of(context).phoneNumber(
                        label: S.of(context).phoneNumber,
                        controller: _phoneNumberController,
                        countryCode: '${Constants.countryCode} '),
                    AppStyles.sizedBoxSpace(height: 16),
                    // Input.of(context).password(
                    //   label: S.of(context).password,
                    //   controller: _passwordController,
                    // ),
                    AppStyles.sizedBoxSpace(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: Buttons.primary(
                          child: Text(
                            S.of(context).signIn,
                            style: AppStyles.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              UserService.alreadyExists(
                                      phoneNumber:
                                          _phoneNumberController.text.trim())
                                  .then((isExist) {
                                if (!isExist) {
                                  AppDialogs.of(context).showAlertDialog(
                                      title: S.of(context).signInErrorTitle,
                                      message:
                                          S.of(context).phoneNumberNotValid,
                                      positiveText: S.of(context).ok,
                                      onPositivePressed: () {
                                        Navigator.pop(context);
                                      });
                                  return;
                                }

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CodeSending(
                                      phoneNumber:
                                          _phoneNumberController.text.trim(),
                                      name: '',
                                      from: 'sign_in');
                                }));
                              });
                            }
                          }),
                    ),
                    _buildNavigator(context)
                  ],
                ),
              ))),
              _buildGoogleButton(context),
            ],
          )),
    );
  }
}

Widget _buildNavigator(context) {
  return Container(
      padding: const EdgeInsets.only(top: 34),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SignUpScreen(isFromOnBoarding: true)));
            },
            child: Text(
              S.of(context).forgotPassword,
              style: AppStyles.h3.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
          AppStyles.sizedBoxSpace(height: 34),
          RichText(
              text: TextSpan(
                  text: S.of(context).dontHaveAccount,
                  style: AppStyles.h4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textFieldsHintColor,
                  ),
                  children: [
                TextSpan(
                    text: S.of(context).signUp,
                    style: AppStyles.h4.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen(
                                    isFromOnBoarding: true)));
                      })
              ]))
        ],
      ));
}

Widget _buildGoogleButton(context) {
  return SizedBox(
      width: double.infinity,
      child: Buttons.stroke(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcons.iconGoogle),
              AppStyles.sizedBoxSpace(width: 8),
              Text(
                S.of(context).signInWithGoogle,
                style: AppStyles.h3.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          onPressed: () async {
            try {
              UserCredential credential =
                  await AuthService().signInWithGoogle();
              print(credential.user!.toString());
              if (credential.user != null) {
                var result = await UserService.saveUser(UserModel.User(
                    uid: credential.user!.uid,
                    displayName: credential.user!.displayName ?? '',
                    mail: credential.user!.email,
                    photoUrl: credential.user!.photoURL ?? '',
                    authType: UserModel.AuthType.google,
                    avatarType: UserModel.AvatarType.google));
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString(Constants.uid, credential.user!.uid);
                prefs.setBool(Constants.isAuth, true);
                prefs.setBool(Constants.isOnboarding, true);
                // navigate to home screen
                // Navigator.pushNamedAndRemoveUntil(
                //     context, AppRoutes.home, (route) => false);
                print('successfull to login with ${credential.user!.email}');
                UserService.getCurrentUser().then((user) {
                  print('user: ${user.toJson()}');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MainScreen(
                        user: user,
                        initialIndex: 0,
                      );
                    }),
                    (route) => false,
                  );
                });
              }
            } catch (e) {
              print(e);
              AppDialogs.of(context).showAlertDialog(
                  title: S.of(context).signInErrorTitle,
                  message: S.of(context).maybeIssueWithThisMethod,
                  positiveText: S.of(context).ok,
                  onPositivePressed: () {
                    Navigator.pop(context);
                  });
            }
          }));
}
