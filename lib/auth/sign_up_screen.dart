import 'package:expense_xpress/auth/code_sending.dart';
import 'package:expense_xpress/auth/sign_in_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/auth_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/inputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:expense_xpress/services/models/user.dart' as user;

class SignUpScreen extends StatefulWidget {
  final bool? isFromOnBoarding;

  const SignUpScreen({super.key, this.isFromOnBoarding});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;

  bool _isFromOnBoarding = false;
  bool _isAgreeToTerms = false;
  bool _isShowLoading = false;

  _signUp(context) async {
    // check validate of form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // check agree to terms
    if (!_isAgreeToTerms) {
      AppDialogs.of(context).showAlertDialog(
          title: S.of(context).error,
          message: S.of(context).termRequired,
          positiveText: S.of(context).ok,
          onPositivePressed: () {
            Navigator.pop(context);
          });
      return;
    }
    // sign up with phone number
    var isExist = await UserService.alreadyExists(
        phoneNumber: _phoneNumberController.text);

    if (isExist) {
      AppDialogs.of(context).showAlertDialog(
          title: S.of(context).error,
          message: S.of(context).alreadySignedUp,
          positiveText: S.of(context).ok,
          onPositivePressed: () {
            Navigator.pop(context);
          });
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CodeSending(
                  phoneNumber: _phoneNumberController.text,
                  name: _nameController.text,
                  from: 'sign_up',
                )));
  }

  @override
  void initState() {
    super.initState();
    _isFromOnBoarding = widget.isFromOnBoarding ?? false;
    _formKey = GlobalKey<FormState>();

    _phoneNumberController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  _getDataFromCodeSending() {
    // get data from code sending
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var data = ModalRoute.of(context)!.settings.arguments as List;
      print('data: $data');
      _phoneNumberController.text = data[0];
      _nameController.text = data[1];
      _isAgreeToTerms = data[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getDataFromCodeSending();
    return Scaffold(
      // backgroundColor: AppColors.background,
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
        title: Text(S.of(context).signUp,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            AppStyles.sizedBoxSpace(height: 40),
            Expanded(
                child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: <Widget>[
                  Input.of(context).text(
                      label: S.of(context).yourName,
                      controller: _nameController),
                  AppStyles.sizedBoxSpace(height: 16),
                  Input.of(context).phoneNumber(
                      label: S.of(context).phoneNumber,
                      controller: _phoneNumberController,
                      countryCode: '${Constants.countryCode} '),
                  AppStyles.sizedBoxSpace(height: 16),
                  // Input.of(context).password(
                  //   label: S.of(context).password,
                  //   controller: _passwordController,
                  // ),
                  // AppStyles.sizedBoxSpace(height: 16),
                  Input.of(context).checkbox(
                      value: _isAgreeToTerms,
                      label: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAgreeToTerms = !_isAgreeToTerms;
                          });
                        },
                        child: RichText(
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                                text: S.of(context).agreeToTerms,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                children: [
                                  TextSpan(
                                      text: S.of(context).termsOfService,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to terms of service
                                          print('terms of service');
                                        },
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                  TextSpan(
                                      text: S.of(context).and,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          )),
                                  TextSpan(
                                      text: S.of(context).privacyPolicy,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to privacy policy
                                          print('privacy policy');
                                        },
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ))
                                ])),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isAgreeToTerms = value;
                        });
                      }),
                  AppStyles.sizedBoxSpace(height: 32),
                  // sign up button
                  SizedBox(
                    width: double.infinity,
                    child: _isShowLoading
                        ? Buttons.of(context).disabled(
                            child: _buildLoading(), onPressed: () {})
                        : Buttons.of(context).primary(
                            child: Text(
                              S.of(context).signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              _signUp(context);
                            }),
                  ),
                  AppStyles.sizedBoxSpace(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).alreadyHaveAccount,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen(
                                        isFromOnBoarding: true)));
                          },
                          child: Text(
                            S.of(context).signIn,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  ),
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

Widget _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
