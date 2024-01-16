import 'dart:async';

import 'package:expense_xpress/auth/sign_up_screen.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/functions/auth_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart' as user;
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/utils/timestamp_converter.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final bool isFromSignUp;
  final String? verificationId;
  final int? resendToken;

  const PinVerificationScreen(
      {super.key,
      required this.phoneNumber,
      required this.name,
      required this.isFromSignUp,
      required this.verificationId,
      this.resendToken});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  late TextEditingController _otpController;
  Timer? _timer;
  int _startTime = Constants.optMaxAge * 2;
  int _otpInvalidTimes = 0;
  String _optCode = '';
  String _verificationId = '';
  String _phoneNumber = '';
  String _name = '';
  bool _isFromSignUp = false;
  bool _isOtpValid = false;
  int _resentToken = 0;

  late final GlobalKey<FormState> _formKey;

  _setTimeout(Duration tick) {
    // duration is time to wait
    // tick is time to update: default tick = 1s
    _timer = Timer.periodic(tick, (t) {
      if (mounted) {
        setState(() {
          _startTime--;
        });
        if (_startTime == 0) {
          _timer?.cancel();
        }
      }
    });
  }

  _validatePhoneNumber(value) async {
    print('otp: $value');
    print('verificationId: $_verificationId');

    if (value.length != Constants.otpLength) {
      setState(() {
        _isOtpValid = false;
      });
      return;
    }

    setState(() {
      _isOtpValid = true;
    });
  }

  _signUp(context, value) async {
    if (_formKey.currentState!.validate()) {
      // show loading popup
      AppDialogs.of(context).showLoadingDialog();
      // sign in with phone number
      await AuthService()
          .signInWithPhoneAuthCredential(PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: value,
      ))
          .then((value) async {
        // save user to firestore
        await UserService.saveUser(user.User(
                uid: value.user!.uid,
                displayName: _name,
                photoUrl: value.user!.photoURL ?? '',
                phone: '${Constants.countryCode} $_phoneNumber',
                mail: value.user!.email,
                authType: AuthType.phone.name,
                lastLogin: DateTime.now(),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()))
            .then((_) async {
          // hide loading dialog
          AppDialogs.of(context).hideLoadingDialog();
          // navigate to home screen
          var user = await UserService.getCurrentUser();
          if (user != null) {
            await SharedPreferences.getInstance().then((pref) {
              pref.setBool(Constants.isAuth, true);
              pref.setBool(Constants.isOnboarding, true);
            });
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return MainScreen(user: user);
            }), (route) => false);
          }
        });
        // Navigator.pushNamedAndRemoveUntil(
        //     context, '/home', (Route<dynamic> route) => false);
      }).catchError((error) {
        print(error);
        // hide loading dialog
        AppDialogs.of(context).hideLoadingDialog();

        if (_otpInvalidTimes >= 3) {
          AppDialogs.of(context).showAlertDialog(
              title: S.of(context).error,
              message: S.of(context).tooManyAttempts,
              positiveText: S.of(context).ok,
              onPositivePressed: () {
                Navigator.pop(context);
              });
          return;
        }
        _otpInvalidTimes++;
        AppDialogs.of(context).showAlertDialog(
            title: S.of(context).error,
            message: S.of(context).invalidCode,
            positiveText: S.of(context).ok,
            onPositivePressed: () {
              Navigator.pop(context);
            });
      });
    }
  }

  _signIn(context, otp) async {
    // show loading popup
    AppDialogs.of(context).showLoadingDialog();
    await AuthService()
        .signInWithPhoneAuthCredential(PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    ))
        .then((userCredential) async {
      // hide loading dialog
      AppDialogs.of(context).hideLoadingDialog();
      // navigate to home screen
      var user = await UserService.getCurrentUser();
      if (user != null) {
        await SharedPreferences.getInstance().then((pref) {
          pref.setBool(Constants.isAuth, true);
          pref.setBool(Constants.isOnboarding, true);
          print('pref set isAuth: ${pref.getBool(Constants.isAuth)}');
        });
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return MainScreen(user: user);
        }), (route) => false);
      }
    }).catchError((error) {
      print(error);
      // hide loading dialog
      AppDialogs.of(context).hideLoadingDialog();
      AppDialogs.of(context).showAlertDialog(
          title: S.of(context).error,
          message: S.of(context).invalidCode,
          positiveText: S.of(context).ok,
          onPositivePressed: () {
            Navigator.pop(context);
          });
    });
  }

  _resend(context) async {
    if (_startTime > 0) {
      AppDialogs.of(context).showAlertDialog(
          title: S.of(context).error,
          message: S.of(context).waitToResendCode(
              TimeStampConverter.secondsToMinutes(_startTime)),
          positiveText: S.of(context).ok,
          onPositivePressed: () {
            Navigator.pop(context);
          });
      return;
    }

    if (_isFromSignUp) {
      // set param for modal route
      var param = [
        _phoneNumber,
        _name,
        _isFromSignUp,
        _verificationId,
        _resentToken
      ];
      // push to code sending screen
      Navigator.pop(context, param);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double pinItemSize =
        (width - (AppStyles.padding * 2)) / Constants.otpLength;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: _isFromSignUp
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
        title: Text(S.of(context).verificationTitle,
            style: AppStyles.h3.copyWith(
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyles.padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.sizedBoxSpace(height: 18),
              Text(
                S.of(context).enterCode,
                style: AppStyles.h1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Form(
                    key: _formKey,
                    child: PinCodeTextField(
                      appContext: context,
                      controller: _otpController,
                      length: Constants.otpLength,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enterCode;
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: pinItemSize,
                        // transparent true
                        activeFillColor: Colors.transparent,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: Colors.black,
                        activeColor: Colors.black,
                        selectedColor: Colors.black,
                        selectedFillColor: Colors.transparent,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (String value) {
                        _validatePhoneNumber(value);
                      },
                      onChanged: (String value) {
                        setState(() {
                          _optCode = value;
                        });
                      },
                      beforeTextPaste: (String? value) {
                        return true;
                      },
                    )),
              ),
              // timer countdown resend code
              Text(
                TimeStampConverter.secondsToMinutes(_startTime),
                style: AppStyles.h4.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              AppStyles.sizedBoxSpace(height: 12),
              // did not receive code
              RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: S.of(context).weSentVerificationCode,
                    style: AppStyles.h4.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${Constants.countryCode} $_phoneNumber ',
                        style: AppStyles.h4.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).youCanCheckYourPhone,
                        style: AppStyles.h4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )),
              AppStyles.sizedBoxSpace(height: 24),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                  ),
                  onPressed: () {
                    _resend(context);
                  },
                  child: Text(
                    S.of(context).didntReceiveCode,
                    style: AppStyles.h4.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                  )),
              AppStyles.sizedBoxSpace(height: 24),
              SizedBox(
                  width: double.infinity,
                  child: _isOtpValid & (_startTime > 0)
                      ? Buttons.primary(
                          child: Text(
                            S.of(context).verify,
                            style: AppStyles.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            // _validatePhoneNumber(_optCode);
                            if (_isFromSignUp) {
                              _signUp(context, _optCode);
                            } else {
                              _signIn(context, _optCode);
                            }
                          })
                      : Buttons.disabled(
                          child: Text(
                            S.of(context).verify,
                            style: AppStyles.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _phoneNumber = widget.phoneNumber;
    _name = widget.name;
    _isFromSignUp = widget.isFromSignUp;
    _verificationId = widget.verificationId ?? '';
    _otpInvalidTimes = 0;
    _optCode = '';
    _isFromSignUp = widget.isFromSignUp;
    _resentToken = widget.resendToken ?? 0;

    _formKey = GlobalKey<FormState>();
    _otpController = TextEditingController();
    super.initState();

    _setTimeout(const Duration(seconds: 1));
  }
}
