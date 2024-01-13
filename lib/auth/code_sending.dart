import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/auth_service.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/animate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_xpress/services/models/user.dart' as user;

class CodeSending extends StatefulWidget {
  final String phoneNumber;
  final String name;

  const CodeSending({super.key, required this.phoneNumber, required this.name});

  @override
  State<CodeSending> createState() => _CodeSendingState();
}

class _CodeSendingState extends State<CodeSending> {
  String _phoneNumber = '';
  String _name = '';
  bool _isVerified = false;
  bool _isCodeSent = false;

  _validatePhoneNumber(String phoneNumber) {
    // subtract 1 for the country code
    if (phoneNumber.length == 9) {
      setState(() {
        _isVerified = true;
      });
      return;
    }

    Navigator.pop(context, [_phoneNumber, _name, _isVerified]);
  }

  _signUpAndSendCode(context) async {
    await AuthService().signUpWithPhoneNumber(
      '${Constants.countryCode} $_phoneNumber',
      {
        'verificationCompleted':
            (PhoneAuthCredential phoneAuthCredential) async {
          //[NOTE] JUST APPLY FOR ANDROID
          // sign in with phone number
          await AuthService()
              .signInWithPhoneAuthCredential(phoneAuthCredential)
              .then((value) async {
            // save user to firestore
            await UserService.saveUser(user.User(
                uid: value.user!.uid,
                displayName: _name,
                photoUrl: value.user!.photoURL ?? '',
                phone: '${Constants.countryCode} $_phoneNumber',
                mail: value.user!.email,
                authType: 'phone'));
            // await AuthService().saveUser(
            //     value.user!.uid,
            //     _nameController.text,
            //     '${Constants.countryCode} ${_phoneNumberController.text}',
            //     value.user!.email,
            //     value.user!.photoURL);
            // hide loading dialog
            // navigate to home screen
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/home', (route) => false);
          });
        },
        'verificationFailed': (FirebaseAuthException firebaseAuthException) {
          print('verificationFailed');
          // hide loading dialog
          AppDialogs.of(context).showAlertDialog(
              title: S.of(context).error,
              message: firebaseAuthException.message ?? '',
              positiveText: S.of(context).ok,
              onPositivePressed: () {
                Navigator.pop(context);
              });
        },
        'codeSent': (String verificationId, int? resendToken) async {
          // hide loading dialog
          print('codeSent $_phoneNumber with $verificationId and $resendToken');
          setState(() {
            _isCodeSent = true;
          });
          // // navigate to otp screen
          // Navigator.pushNamed(context, '/otp', arguments: {
          //   'verificationId': verificationId,
          //   'phoneNumber': _phoneNumberController.text,
          //   'name': _nameController.text,
          //   'isFromSignUp': true
          // });
        },
        'timeout': const Duration(seconds: Constants.optMaxAge * 2),
        'codeAutoRetrievalTimeout': (String verificationId) {
          // hide loading dialog
          print('codeAutoRetrievalTimeout');
          // setState(() {
          //   _isShowLoading = false;
          // });
          // // navigate to otp screen
          // Navigator.pushNamed(context, '/otp', arguments: {
          //   'verificationId': verificationId,
          //   'phoneNumber': _phoneNumberController.text,
          //   'name': _nameController.text,
          //   'isFromSignUp': true
          // });
        },
        'onUserExists': (bool isExist) {}
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _phoneNumber = widget.phoneNumber;
    _name = widget.name;
    // validate phone after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      _validatePhoneNumber(_phoneNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isVerified) {
      _signUpAndSendCode(context);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppStyles.sizedBoxSpace(height: 40),
              AppAnimate().fade(
                child: SvgPicture.asset(ImagesAsset.codeSending),
              ),
              AppStyles.sizedBoxSpace(height: AppStyles.padding),
              Expanded(
                  child: Column(children: [
                AppAnimate(curve: Curves.linear).fade(
                  child: Text(
                    _isVerified
                        ? S.of(context).yourCodeOnTheWay
                        : S.of(context).yourPhoneVerifying,
                    style: AppStyles.h2.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppStyles.sizedBoxSpace(height: AppStyles.padding),
                AppAnimate().fade(
                    child: _isCodeSent
                        ? Text(
                            S.of(context).checkingYourPhone(
                                '${Constants.countryCode} $_phoneNumber'),
                            style: AppStyles.h4.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : const CircularProgressIndicator()),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
