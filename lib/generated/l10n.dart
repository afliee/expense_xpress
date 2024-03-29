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

  /// `Not a valid phone number`
  String get notValidPhoneNumber {
    return Intl.message(
      'Not a valid phone number',
      name: 'notValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get bugdet {
    return Intl.message(
      'Budget',
      name: 'bugdet',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Display Name`
  String get displayName {
    return Intl.message(
      'Display Name',
      name: 'displayName',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get lastLogin {
    return Intl.message(
      'Last Login',
      name: 'lastLogin',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Join Date`
  String get joinDate {
    return Intl.message(
      'Join Date',
      name: 'joinDate',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get editProfile {
    return Intl.message(
      'Change Profile Picture',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `You can edit your profile with us options`
  String get youCanEditYourProfileWithUsOptions {
    return Intl.message(
      'You can edit your profile with us options',
      name: 'youCanEditYourProfileWithUsOptions',
      desc: '',
      args: [],
    );
  }

  /// `Default Gallery`
  String get defaultGallery {
    return Intl.message(
      'Default Gallery',
      name: 'defaultGallery',
      desc: '',
      args: [],
    );
  }

  /// `Your Camera`
  String get yourCamera {
    return Intl.message(
      'Your Camera',
      name: 'yourCamera',
      desc: '',
      args: [],
    );
  }

  /// `Your Gallery`
  String get yourGallery {
    return Intl.message(
      'Your Gallery',
      name: 'yourGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Credential`
  String get credential {
    return Intl.message(
      'Credential',
      name: 'credential',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo from us gallery`
  String get choosePhotoFromUsGallery {
    return Intl.message(
      'Choose photo from us gallery',
      name: 'choosePhotoFromUsGallery',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo from your gallery`
  String get choosePhotoFromYourGallery {
    return Intl.message(
      'Choose photo from your gallery',
      name: 'choosePhotoFromYourGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take photo with your camera`
  String get takePhotoWithYourCamera {
    return Intl.message(
      'Take photo with your camera',
      name: 'takePhotoWithYourCamera',
      desc: '',
      args: [],
    );
  }

  /// `Profile Settings`
  String get profileSettings {
    return Intl.message(
      'Profile Settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `UnKnown`
  String get unKnown {
    return Intl.message(
      'UnKnown',
      name: 'unKnown',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get display {
    return Intl.message(
      'Display',
      name: 'display',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Your wallets`
  String get yourWallets {
    return Intl.message(
      'Your wallets',
      name: 'yourWallets',
      desc: '',
      args: [],
    );
  }

  /// `Add new wallet`
  String get addNewWallet {
    return Intl.message(
      'Add new wallet',
      name: 'addNewWallet',
      desc: '',
      args: [],
    );
  }

  /// `Wallet name`
  String get walletName {
    return Intl.message(
      'Wallet name',
      name: 'walletName',
      desc: '',
      args: [],
    );
  }

  /// `Wallet balance`
  String get walletBalance {
    return Intl.message(
      'Wallet balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Wallet currency`
  String get walletCurrency {
    return Intl.message(
      'Wallet currency',
      name: 'walletCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `{walletType} wallet`
  String walletType(String walletType) {
    return Intl.message(
      '$walletType wallet',
      name: 'walletType',
      desc: '',
      args: [walletType],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Debt/ Loan`
  String get debtAndLoan {
    return Intl.message(
      'Debt/ Loan',
      name: 'debtAndLoan',
      desc: '',
      args: [],
    );
  }

  /// `Savings`
  String get savings {
    return Intl.message(
      'Savings',
      name: 'savings',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Clothing`
  String get clothing {
    return Intl.message(
      'Clothing',
      name: 'clothing',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Furniture`
  String get furniture {
    return Intl.message(
      'Furniture',
      name: 'furniture',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Personal Items`
  String get personalItems {
    return Intl.message(
      'Personal Items',
      name: 'personalItems',
      desc: '',
      args: [],
    );
  }

  /// `Transportation`
  String get transportation {
    return Intl.message(
      'Transportation',
      name: 'transportation',
      desc: '',
      args: [],
    );
  }

  /// `Household`
  String get household {
    return Intl.message(
      'Household',
      name: 'household',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Pet`
  String get pet {
    return Intl.message(
      'Pet',
      name: 'pet',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
      desc: '',
      args: [],
    );
  }

  /// `Bills`
  String get bills {
    return Intl.message(
      'Bills',
      name: 'bills',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `Investment`
  String get investment {
    return Intl.message(
      'Investment',
      name: 'investment',
      desc: '',
      args: [],
    );
  }

  /// `Household Services`
  String get houseHoldServices {
    return Intl.message(
      'Household Services',
      name: 'houseHoldServices',
      desc: '',
      args: [],
    );
  }

  /// `Household Appliances`
  String get houseHoldAppliances {
    return Intl.message(
      'Household Appliances',
      name: 'houseHoldAppliances',
      desc: '',
      args: [],
    );
  }

  /// `Beauty`
  String get beauty {
    return Intl.message(
      'Beauty',
      name: 'beauty',
      desc: '',
      args: [],
    );
  }

  /// `Home Repair`
  String get homeRepair {
    return Intl.message(
      'Home Repair',
      name: 'homeRepair',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get rent {
    return Intl.message(
      'Rent',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `Other Expense`
  String get otherExpense {
    return Intl.message(
      'Other Expense',
      name: 'otherExpense',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Bonus`
  String get bonus {
    return Intl.message(
      'Bonus',
      name: 'bonus',
      desc: '',
      args: [],
    );
  }

  /// `Interest Money`
  String get interestMoney {
    return Intl.message(
      'Interest Money',
      name: 'interestMoney',
      desc: '',
      args: [],
    );
  }

  /// `Other Income`
  String get otherIncome {
    return Intl.message(
      'Other Income',
      name: 'otherIncome',
      desc: '',
      args: [],
    );
  }

  /// `Borrowed Money`
  String get borrowedMoney {
    return Intl.message(
      'Borrowed Money',
      name: 'borrowedMoney',
      desc: '',
      args: [],
    );
  }

  /// `Lent Money`
  String get lentMoney {
    return Intl.message(
      'Lent Money',
      name: 'lentMoney',
      desc: '',
      args: [],
    );
  }

  /// `Repay Debt`
  String get repayDebt {
    return Intl.message(
      'Repay Debt',
      name: 'repayDebt',
      desc: '',
      args: [],
    );
  }

  /// `Add New Category`
  String get addNewCategory {
    return Intl.message(
      'Add New Category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryName {
    return Intl.message(
      'Category Name',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `You can pick icon`
  String get yourCanPickIcon {
    return Intl.message(
      'You can pick icon',
      name: 'yourCanPickIcon',
      desc: '',
      args: [],
    );
  }

  /// `Category already exists`
  String get categoryAlreadyExists {
    return Intl.message(
      'Category already exists',
      name: 'categoryAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Category Group`
  String get categoryGroup {
    return Intl.message(
      'Category Group',
      name: 'categoryGroup',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Create category successfully`
  String get createCategorySuccess {
    return Intl.message(
      'Create category successfully',
      name: 'createCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get deleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'deleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this category?`
  String get deleteCategoryMessage {
    return Intl.message(
      'Are you sure to delete this category?',
      name: 'deleteCategoryMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to continue?`
  String get areYouSureToContinue {
    return Intl.message(
      'Are you sure to continue?',
      name: 'areYouSureToContinue',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Create category failed`
  String get createCategoryFailed {
    return Intl.message(
      'Create category failed',
      name: 'createCategoryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Choose Action`
  String get chooseAction {
    return Intl.message(
      'Choose Action',
      name: 'chooseAction',
      desc: '',
      args: [],
    );
  }

  /// `Choose Action for '{categoryName}'`
  String chooseActionFor(String categoryName) {
    return Intl.message(
      'Choose Action for \'$categoryName\'',
      name: 'chooseActionFor',
      desc: '',
      args: [categoryName],
    );
  }

  /// `Edit category successfully`
  String get editCategorySuccess {
    return Intl.message(
      'Edit category successfully',
      name: 'editCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete category successfully`
  String get deleteCategorySuccess {
    return Intl.message(
      'Delete category successfully',
      name: 'deleteCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong in process`
  String get somethingWentWrongInProcess {
    return Intl.message(
      'Something went wrong in process',
      name: 'somethingWentWrongInProcess',
      desc: '',
      args: [],
    );
  }

  /// `Cash Flow`
  String get cashFlow {
    return Intl.message(
      'Cash Flow',
      name: 'cashFlow',
      desc: '',
      args: [],
    );
  }

  /// `Cash Wallet`
  String get cashWallet {
    return Intl.message(
      'Cash Wallet',
      name: 'cashWallet',
      desc: '',
      args: [],
    );
  }

  /// `Cash Wallet is the wallet that you can use to store your cash`
  String get cashWalletDescription {
    return Intl.message(
      'Cash Wallet is the wallet that you can use to store your cash',
      name: 'cashWalletDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Track your credit card transactions and pay your bills on time`
  String get creditCardDescription {
    return Intl.message(
      'Track your credit card transactions and pay your bills on time',
      name: 'creditCardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add New Transaction`
  String get addNewTransaction {
    return Intl.message(
      'Add New Transaction',
      name: 'addNewTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Create New Wallet`
  String get createNewWallet {
    return Intl.message(
      'Create New Wallet',
      name: 'createNewWallet',
      desc: '',
      args: [],
    );
  }

  /// `New Wallet`
  String get newWallet {
    return Intl.message(
      'New Wallet',
      name: 'newWallet',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Wallet name is required`
  String get walletNameRequired {
    return Intl.message(
      'Wallet name is required',
      name: 'walletNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Wallet balance is required`
  String get walletBalanceRequired {
    return Intl.message(
      'Wallet balance is required',
      name: 'walletBalanceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Notify me`
  String get notifyMe {
    return Intl.message(
      'Notify me',
      name: 'notifyMe',
      desc: '',
      args: [],
    );
  }

  /// `Notify me when balance is low`
  String get notifyMeWhenBalanceIsLow {
    return Intl.message(
      'Notify me when balance is low',
      name: 'notifyMeWhenBalanceIsLow',
      desc: '',
      args: [],
    );
  }

  /// `Savings Wallet`
  String get savingsWallet {
    return Intl.message(
      'Savings Wallet',
      name: 'savingsWallet',
      desc: '',
      args: [],
    );
  }

  /// `Savings Wallet is the wallet that you can use to store your savings`
  String get savingsWalletDescription {
    return Intl.message(
      'Savings Wallet is the wallet that you can use to store your savings',
      name: 'savingsWalletDescription',
      desc: '',
      args: [],
    );
  }

  /// `Initial Balance`
  String get initialBalance {
    return Intl.message(
      'Initial Balance',
      name: 'initialBalance',
      desc: '',
      args: [],
    );
  }

  /// `This method is currently not supported`
  String get thisMethodCurrentlyNotSupported {
    return Intl.message(
      'This method is currently not supported',
      name: 'thisMethodCurrentlyNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `Save Wallet`
  String get saveWallet {
    return Intl.message(
      'Save Wallet',
      name: 'saveWallet',
      desc: '',
      args: [],
    );
  }

  /// `Create wallet successfully`
  String get createWalletSuccess {
    return Intl.message(
      'Create wallet successfully',
      name: 'createWalletSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create wallet failed`
  String get createWalletFailed {
    return Intl.message(
      'Create wallet failed',
      name: 'createWalletFailed',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred`
  String get errorOccurred {
    return Intl.message(
      'Error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Expected number`
  String get expectedNumber {
    return Intl.message(
      'Expected number',
      name: 'expectedNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expected date`
  String get expectedDate {
    return Intl.message(
      'Expected date',
      name: 'expectedDate',
      desc: '',
      args: [],
    );
  }

  /// `Time you want to save`
  String get valueYouWantToSave {
    return Intl.message(
      'Time you want to save',
      name: 'valueYouWantToSave',
      desc: '',
      args: [],
    );
  }

  /// `Expected number is required`
  String get expectedNumberIsRequired {
    return Intl.message(
      'Expected number is required',
      name: 'expectedNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Expected number must be greater than zero`
  String get expectedNumberMustGreaterThanZero {
    return Intl.message(
      'Expected number must be greater than zero',
      name: 'expectedNumberMustGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Expected number must be greater than balance and initial balance`
  String get expectedNumberMustGreaterThanBalanceAndInitialBalance {
    return Intl.message(
      'Expected number must be greater than balance and initial balance',
      name: 'expectedNumberMustGreaterThanBalanceAndInitialBalance',
      desc: '',
      args: [],
    );
  }

  /// `Expected number must be greater than zero`
  String get expectedNumberMustBeGreaterThanZero {
    return Intl.message(
      'Expected number must be greater than zero',
      name: 'expectedNumberMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Initial balance is required`
  String get initialBalanceIsRequired {
    return Intl.message(
      'Initial balance is required',
      name: 'initialBalanceIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Initial balance must be greater than zero`
  String get initialBalanceMustBeGreaterThanZero {
    return Intl.message(
      'Initial balance must be greater than zero',
      name: 'initialBalanceMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Initial balance must be less than balance`
  String get initialBalanceMustLessThanBalance {
    return Intl.message(
      'Initial balance must be less than balance',
      name: 'initialBalanceMustLessThanBalance',
      desc: '',
      args: [],
    );
  }

  /// `Due {date}`
  String dueDate(String date) {
    return Intl.message(
      'Due $date',
      name: 'dueDate',
      desc: '',
      args: [date],
    );
  }

  /// `Restore Wallet`
  String get restoreWallet {
    return Intl.message(
      'Restore Wallet',
      name: 'restoreWallet',
      desc: '',
      args: [],
    );
  }

  /// `Budgets`
  String get budgets {
    return Intl.message(
      'Budgets',
      name: 'budgets',
      desc: '',
      args: [],
    );
  }

  /// `New Budget`
  String get newBudget {
    return Intl.message(
      'New Budget',
      name: 'newBudget',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message(
      'Yearly',
      name: 'yearly',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Let's start by creating a new budget`
  String get letStartByCreatingNewBudget {
    return Intl.message(
      'Let\'s start by creating a new budget',
      name: 'letStartByCreatingNewBudget',
      desc: '',
      args: [],
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
