// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get selectLanguage {
    return Intl.message(
      'Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Gain total control of your money`
  String get onBoardingTitle1 {
    return Intl.message(
      'Gain total control of your money',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Know where your money goes`
  String get onBoardingTitle2 {
    return Intl.message(
      'Know where your money goes',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Planning ahead`
  String get onBoardingTitle3 {
    return Intl.message(
      'Planning ahead',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Become your own money manager and make every cent count.`
  String get onBoardingDescription1 {
    return Intl.message(
      'Become your own money manager and make every cent count.',
      name: 'onBoardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Track your transaction easily, with categories and financial report `
  String get onBoardingDescription2 {
    return Intl.message(
      'Track your transaction easily, with categories and financial report ',
      name: 'onBoardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Setup your budget for each category so you in control`
  String get onBoardingDescription3 {
    return Intl.message(
      'Setup your budget for each category so you in control',
      name: 'onBoardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account yet? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get requireSomeText {
    return Intl.message(
      'Please enter some text',
      name: 'requireSomeText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get phoneNumberException {
    return Intl.message(
      'Please enter your phone number',
      name: 'phoneNumberException',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordException {
    return Intl.message(
      'Please enter your password',
      name: 'passwordException',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is not valid`
  String get phoneNumberNotValid {
    return Intl.message(
      'Phone number is not valid',
      name: 'phoneNumberNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordRequired {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get phoneNumberHint {
    return Intl.message(
      'Please enter your phone number',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordHint {
    return Intl.message(
      'Please enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In Error`
  String get signInErrorTitle {
    return Intl.message(
      'Sign In Error',
      name: 'signInErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to our Terms of Service and Privacy Policy`
  String get termRequired {
    return Intl.message(
      'Please agree to our Terms of Service and Privacy Policy',
      name: 'termRequired',
      desc: '',
      args: [],
    );
  }

  /// `You already have an account`
  String get alreadySignedUp {
    return Intl.message(
      'You already have an account',
      name: 'alreadySignedUp',
      desc: '',
      args: [],
    );
  }

  /// `already in use`
  String get alreadyInUse {
    return Intl.message(
      'already in use',
      name: 'alreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `There is an issue with this method\n Please try again later`
  String get maybeIssueWithThisMethod {
    return Intl.message(
      'There is an issue with this method\n Please try again later',
      name: 'maybeIssueWithThisMethod',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to our `
  String get agreeToTerms {
    return Intl.message(
      'By signing up, you agree to our ',
      name: 'agreeToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Verifying your phone number`
  String get yourPhoneVerifying {
    return Intl.message(
      'Verifying your phone number',
      name: 'yourPhoneVerifying',
      desc: '',
      args: [],
    );
  }

  /// `Your code is on the way`
  String get yourCodeOnTheWay {
    return Intl.message(
      'Your code is on the way',
      name: 'yourCodeOnTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Checking your phone {phoneNumber} and enter the code in next step to verify your phone number`
  String checkingYourPhone(String phoneNumber) {
    return Intl.message(
      'Checking your phone $phoneNumber and enter the code in next step to verify your phone number',
      name: 'checkingYourPhone',
      desc: '',
      args: [phoneNumber],
    );
  }

  /// `Verification`
  String get verificationTitle {
    return Intl.message(
      'Verification',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Verification Code`
  String get enterCode {
    return Intl.message(
      'Enter your Verification Code',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `We sent a verification code to `
  String get weSentVerificationCode {
    return Intl.message(
      'We sent a verification code to ',
      name: 'weSentVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `You can check your phone`
  String get youCanCheckYourPhone {
    return Intl.message(
      'You can check your phone',
      name: 'youCanCheckYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is required`
  String get verificationCodeRequired {
    return Intl.message(
      'Verification code is required',
      name: 'verificationCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `I didn’t received the code? Send again`
  String get didntReceiveCode {
    return Intl.message(
      'I didn’t received the code? Send again',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code! Please try again`
  String get invalidCode {
    return Intl.message(
      'Invalid code! Please try again',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts! Please try again later`
  String get tooManyAttempts {
    return Intl.message(
      'Too many attempts! Please try again later',
      name: 'tooManyAttempts',
      desc: '',
      args: [],
    );
  }

  /// `Please wait {seconds} seconds to resend the code`
  String waitToResendCode(String seconds) {
    return Intl.message(
      'Please wait $seconds seconds to resend the code',
      name: 'waitToResendCode',
      desc: '',
      args: [seconds],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
