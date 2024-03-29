import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:expense_xpress/services/models/user.dart';

class AuthService {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // sign up with phone number and multiple other parameters
  Future<void> sendCode(
      String phoneNumber, Map<String, dynamic> opt) async {
    // create a new user with phone number
    // check opt have key action
    if (opt.containsKey('action')) {
      print('action: ${opt['action']}');
      if (opt['action'] == Constants.signUpAction) {
        var isExist =
            await UserService.alreadyExists(phoneNumber: phoneNumber);
        if (isExist) {
          return opt['onUserExists'](isExist);
        }
      }
    }
    // check if exist 'forceResendingToken' in opt then resend code
    if (opt['forceResendingToken'] != null) {
      print('resend code');
      return await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: opt['verificationCompleted'],
          verificationFailed: opt['verificationFailed'],
          codeSent: opt['codeSent'],
          timeout: opt['timeout'],
          forceResendingToken: opt['forceResendingToken'],
          codeAutoRetrievalTimeout: opt['codeAutoRetrievalTimeout']);
    }

    print('send code');
    return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: opt['verificationCompleted'],
        verificationFailed: opt['verificationFailed'],
        codeSent: opt['codeSent'],
        timeout: opt['timeout'],
        codeAutoRetrievalTimeout: opt['codeAutoRetrievalTimeout']);
  }

  Future<UserCredential> signInWithPhoneNumber(
      String verificationId, String smsCode, Map<String, dynamic> opt) async {
    // create a new user with phone number
    var isExist =
        await UserService.alreadyExists(phoneNumber: opt['phoneNumber']);
    if (isExist) {
      return opt['onUserExists'](isExist);
    }

    return await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode));
  }

  Future<UserCredential> signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    return await FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential);
  }

  Future<void> resendCode(String phoneNumber, Map<String, dynamic> opt) async {
    // create a new user with phone number
    var isExist = await UserService.alreadyExists(phoneNumber: phoneNumber);
    if (isExist) {
      return opt['onUserExists'](isExist);
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: opt['verificationCompleted'],
        verificationFailed: opt['verificationFailed'],
        codeSent: opt['codeSent'],
        timeout: opt['timeout'],
        forceResendingToken: opt['forceResendingToken'],
        codeAutoRetrievalTimeout: opt['codeAutoRetrievalTimeout']);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
