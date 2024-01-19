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

  static String m1(seconds) =>
      "Please wait ${seconds} seconds to resend the code";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreeToTerms": MessageLookupByLibrary.simpleMessage(
            "By signing up, you agree to our "),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "alreadyInUse": MessageLookupByLibrary.simpleMessage("already in use"),
        "alreadySignedUp":
            MessageLookupByLibrary.simpleMessage("You already have an account"),
        "and": MessageLookupByLibrary.simpleMessage(" and "),
        "bugdet": MessageLookupByLibrary.simpleMessage("Budget"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "checkingYourPhone": m0,
        "chooseFromGallery":
            MessageLookupByLibrary.simpleMessage("Choose from Gallery"),
        "credential": MessageLookupByLibrary.simpleMessage("Credential"),
        "defaultGallery":
            MessageLookupByLibrary.simpleMessage("Default Gallery"),
        "didntReceiveCode": MessageLookupByLibrary.simpleMessage(
            "I didn’t received the code? Send again"),
        "displayName": MessageLookupByLibrary.simpleMessage("Display Name"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
            "Don\'t have an account yet? "),
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "enterCode": MessageLookupByLibrary.simpleMessage(
            "Enter your Verification Code"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidCode": MessageLookupByLibrary.simpleMessage(
            "Invalid code! Please try again"),
        "joinDate": MessageLookupByLibrary.simpleMessage("Join Date"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastLogin": MessageLookupByLibrary.simpleMessage("Last Login"),
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
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordException":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters"),
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
        "requireSomeText":
            MessageLookupByLibrary.simpleMessage("Please enter some text"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInErrorTitle":
            MessageLookupByLibrary.simpleMessage("Sign In Error"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign In with Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("Take Photo"),
        "termRequired": MessageLookupByLibrary.simpleMessage(
            "Please agree to our Terms of Service and Privacy Policy"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
            "Too many attempts! Please try again later"),
        "transactions": MessageLookupByLibrary.simpleMessage("Transactions"),
        "verificationCodeRequired": MessageLookupByLibrary.simpleMessage(
            "Verification code is required"),
        "verificationTitle":
            MessageLookupByLibrary.simpleMessage("Verification"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "waitToResendCode": m1,
        "weSentVerificationCode": MessageLookupByLibrary.simpleMessage(
            "We sent a verification code to "),
        "youCanCheckYourPhone":
            MessageLookupByLibrary.simpleMessage("You can check your phone"),
        "yourCamera": MessageLookupByLibrary.simpleMessage("Your Camera"),
        "yourCodeOnTheWay":
            MessageLookupByLibrary.simpleMessage("Your code is on the way"),
        "yourGallery": MessageLookupByLibrary.simpleMessage("Your Gallery"),
        "yourName": MessageLookupByLibrary.simpleMessage("Your Name"),
        "yourPhoneVerifying":
            MessageLookupByLibrary.simpleMessage("Verifying your phone number")
      };
}
