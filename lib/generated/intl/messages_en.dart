// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(phoneNumber) =>
      "Checking your phone ${phoneNumber} and enter the code in next step to verify your phone number";

  static String m1(categoryName) => "Choose Action for \'${categoryName}\'";

  static String m2(seconds) =>
      "Please wait ${seconds} seconds to resend the code";

  static String m3(walletType) => "${walletType} wallet";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addNewCategory":
            MessageLookupByLibrary.simpleMessage("Add New Category"),
        "addNewWallet": MessageLookupByLibrary.simpleMessage("Add new wallet"),
        "agreeToTerms": MessageLookupByLibrary.simpleMessage(
            "By signing up, you agree to our "),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "alreadyInUse": MessageLookupByLibrary.simpleMessage("already in use"),
        "alreadySignedUp":
            MessageLookupByLibrary.simpleMessage("You already have an account"),
        "and": MessageLookupByLibrary.simpleMessage(" and "),
        "areYouSureToContinue":
            MessageLookupByLibrary.simpleMessage("Are you sure to continue?"),
        "beauty": MessageLookupByLibrary.simpleMessage("Beauty"),
        "bills": MessageLookupByLibrary.simpleMessage("Bills"),
        "bonus": MessageLookupByLibrary.simpleMessage("Bonus"),
        "borrowedMoney": MessageLookupByLibrary.simpleMessage("Borrowed Money"),
        "bugdet": MessageLookupByLibrary.simpleMessage("Budget"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cash": MessageLookupByLibrary.simpleMessage("Cash"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "categoryAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Category already exists"),
        "categoryGroup": MessageLookupByLibrary.simpleMessage("Category Group"),
        "categoryName": MessageLookupByLibrary.simpleMessage("Category Name"),
        "checkingYourPhone": m0,
        "chooseAction": MessageLookupByLibrary.simpleMessage("Choose Action"),
        "chooseActionFor": m1,
        "chooseFromGallery":
            MessageLookupByLibrary.simpleMessage("Choose from Gallery"),
        "choosePhotoFromUsGallery": MessageLookupByLibrary.simpleMessage(
            "Choose photo from us gallery"),
        "choosePhotoFromYourGallery": MessageLookupByLibrary.simpleMessage(
            "Choose photo from your gallery"),
        "clothing": MessageLookupByLibrary.simpleMessage("Clothing"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "createCategoryFailed":
            MessageLookupByLibrary.simpleMessage("Create category failed"),
        "createCategorySuccess": MessageLookupByLibrary.simpleMessage(
            "Create category successfully"),
        "credential": MessageLookupByLibrary.simpleMessage("Credential"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "debtAndLoan": MessageLookupByLibrary.simpleMessage("Debt/ Loan"),
        "defaultGallery":
            MessageLookupByLibrary.simpleMessage("Default Gallery"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteCategory":
            MessageLookupByLibrary.simpleMessage("Delete Category"),
        "deleteCategoryMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure to delete this category?"),
        "deleteCategorySuccess": MessageLookupByLibrary.simpleMessage(
            "Delete category successfully"),
        "didntReceiveCode": MessageLookupByLibrary.simpleMessage(
            "I didn’t received the code? Send again"),
        "display": MessageLookupByLibrary.simpleMessage("Display"),
        "displayName": MessageLookupByLibrary.simpleMessage("Display Name"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
            "Don\'t have an account yet? "),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editCategorySuccess":
            MessageLookupByLibrary.simpleMessage("Edit category successfully"),
        "editProfile":
            MessageLookupByLibrary.simpleMessage("Change Profile Picture"),
        "education": MessageLookupByLibrary.simpleMessage("Education"),
        "enterCode": MessageLookupByLibrary.simpleMessage(
            "Enter your Verification Code"),
        "entertainment": MessageLookupByLibrary.simpleMessage("Entertainment"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "expense": MessageLookupByLibrary.simpleMessage("Expense"),
        "food": MessageLookupByLibrary.simpleMessage("Food"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "furniture": MessageLookupByLibrary.simpleMessage("Furniture"),
        "gift": MessageLookupByLibrary.simpleMessage("Gift"),
        "health": MessageLookupByLibrary.simpleMessage("Health"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeRepair": MessageLookupByLibrary.simpleMessage("Home Repair"),
        "houseHoldAppliances":
            MessageLookupByLibrary.simpleMessage("Household Appliances"),
        "houseHoldServices":
            MessageLookupByLibrary.simpleMessage("Household Services"),
        "household": MessageLookupByLibrary.simpleMessage("Household"),
        "income": MessageLookupByLibrary.simpleMessage("Income"),
        "insurance": MessageLookupByLibrary.simpleMessage("Insurance"),
        "interestMoney": MessageLookupByLibrary.simpleMessage("Interest Money"),
        "invalidCode": MessageLookupByLibrary.simpleMessage(
            "Invalid code! Please try again"),
        "investment": MessageLookupByLibrary.simpleMessage("Investment"),
        "joinDate": MessageLookupByLibrary.simpleMessage("Join Date"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastLogin": MessageLookupByLibrary.simpleMessage("Last Login"),
        "lentMoney": MessageLookupByLibrary.simpleMessage("Lent Money"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "maybeIssueWithThisMethod": MessageLookupByLibrary.simpleMessage(
            "There is an issue with this method\n Please try again later"),
        "notValidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Not a valid phone number"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onBoardingDescription1": MessageLookupByLibrary.simpleMessage(
            "Become your own money manager and make every cent count."),
        "onBoardingDescription2": MessageLookupByLibrary.simpleMessage(
            "Track your transaction easily, with categories and financial report "),
        "onBoardingDescription3": MessageLookupByLibrary.simpleMessage(
            "Setup your budget for each category so you in control"),
        "onBoardingTitle1": MessageLookupByLibrary.simpleMessage(
            "Gain total control of your money"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Know where your money goes"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Planning ahead"),
        "otherExpense": MessageLookupByLibrary.simpleMessage("Other Expense"),
        "otherIncome": MessageLookupByLibrary.simpleMessage("Other Income"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordException":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters"),
        "personal": MessageLookupByLibrary.simpleMessage("Personal"),
        "personalItems": MessageLookupByLibrary.simpleMessage("Personal Items"),
        "pet": MessageLookupByLibrary.simpleMessage("Pet"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "phoneNumberException": MessageLookupByLibrary.simpleMessage(
            "Please enter your phone number"),
        "phoneNumberHint": MessageLookupByLibrary.simpleMessage(
            "Please enter your phone number"),
        "phoneNumberNotValid":
            MessageLookupByLibrary.simpleMessage("Phone number is not valid"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("Phone number is required"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileSettings":
            MessageLookupByLibrary.simpleMessage("Profile Settings"),
        "rent": MessageLookupByLibrary.simpleMessage("Rent"),
        "repayDebt": MessageLookupByLibrary.simpleMessage("Repay Debt"),
        "requireSomeText":
            MessageLookupByLibrary.simpleMessage("Please enter some text"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
        "salary": MessageLookupByLibrary.simpleMessage("Salary"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "savings": MessageLookupByLibrary.simpleMessage("Savings"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "shopping": MessageLookupByLibrary.simpleMessage("Shopping"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInErrorTitle":
            MessageLookupByLibrary.simpleMessage("Sign In Error"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign In with Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "somethingWentWrongInProcess": MessageLookupByLibrary.simpleMessage(
            "Something went wrong in process"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("Take Photo"),
        "takePhotoWithYourCamera":
            MessageLookupByLibrary.simpleMessage("Take photo with your camera"),
        "termRequired": MessageLookupByLibrary.simpleMessage(
            "Please agree to our Terms of Service and Privacy Policy"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
            "Too many attempts! Please try again later"),
        "transactions": MessageLookupByLibrary.simpleMessage("Transactions"),
        "transportation":
            MessageLookupByLibrary.simpleMessage("Transportation"),
        "travel": MessageLookupByLibrary.simpleMessage("Travel"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "unKnown": MessageLookupByLibrary.simpleMessage("UnKnown"),
        "verificationCodeRequired": MessageLookupByLibrary.simpleMessage(
            "Verification code is required"),
        "verificationTitle":
            MessageLookupByLibrary.simpleMessage("Verification"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "viewAll": MessageLookupByLibrary.simpleMessage("View All"),
        "waitToResendCode": m2,
        "walletBalance": MessageLookupByLibrary.simpleMessage("Wallet balance"),
        "walletCurrency":
            MessageLookupByLibrary.simpleMessage("Wallet currency"),
        "walletName": MessageLookupByLibrary.simpleMessage("Wallet name"),
        "walletType": m3,
        "weSentVerificationCode": MessageLookupByLibrary.simpleMessage(
            "We sent a verification code to "),
        "youCanCheckYourPhone":
            MessageLookupByLibrary.simpleMessage("You can check your phone"),
        "youCanEditYourProfileWithUsOptions":
            MessageLookupByLibrary.simpleMessage(
                "You can edit your profile with us options"),
        "yourCamera": MessageLookupByLibrary.simpleMessage("Your Camera"),
        "yourCanPickIcon":
            MessageLookupByLibrary.simpleMessage("You can pick icon"),
        "yourCodeOnTheWay":
            MessageLookupByLibrary.simpleMessage("Your code is on the way"),
        "yourGallery": MessageLookupByLibrary.simpleMessage("Your Gallery"),
        "yourName": MessageLookupByLibrary.simpleMessage("Your Name"),
        "yourPhoneVerifying":
            MessageLookupByLibrary.simpleMessage("Verifying your phone number"),
        "yourWallets": MessageLookupByLibrary.simpleMessage("Your wallets")
      };
}
