// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(phoneNumber) =>
      "Kiểm tra số điện thoại ${phoneNumber} của bạn và nhập mã xác minh ở bước kế tiếp để xác minh số điện thoại của bạn";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreeToTerms":
            MessageLookupByLibrary.simpleMessage("Tôi đồng ý với các "),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Bạn đã có tài khoản?"),
        "alreadySignedUp":
            MessageLookupByLibrary.simpleMessage("Bạn đã đăng ký"),
        "and": MessageLookupByLibrary.simpleMessage(" và "),
        "checkingYourPhone": m0,
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Bạn chưa có tài khoản?"),
        "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "maybeIssueWithThisMethod": MessageLookupByLibrary.simpleMessage(
            "Có vẻ phương thực hiện tại đang gặp vấn đề\n Hãy thử lại sau"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onBoardingDescription1": MessageLookupByLibrary.simpleMessage(
            "Quản lý tài chính cá nhân của bạn với ứng dụng tiện lợi."),
        "onBoardingDescription2": MessageLookupByLibrary.simpleMessage(
            "Theo dõi dòng tiền của bạn để biết bạn đã chi tiêu như thế nào."),
        "onBoardingDescription3": MessageLookupByLibrary.simpleMessage(
            "Lập kế hoạch ngân sách của bạn để tiết kiệm tiền."),
        "onBoardingTitle1":
            MessageLookupByLibrary.simpleMessage("Kiểm soát tài chính của bạn"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Theo dõi dòng tiền của bạn"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Làm chủ ngân sách của bạn"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passwordException":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu của bạn"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Hãy nhập mật khẩu của bạn"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu chứa ít nhất 8 ký tự"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "phoneNumberException":
            MessageLookupByLibrary.simpleMessage("Nhập số điện thoại của bạn"),
        "phoneNumberHint": MessageLookupByLibrary.simpleMessage(
            "Hãy nhập số điện thoại của bạn"),
        "phoneNumberNotValid":
            MessageLookupByLibrary.simpleMessage("Số điện thoại không hợp lệ"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("Yêu cầu số điện thoại"),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Chính sách bảo mật"),
        "requireSomeText":
            MessageLookupByLibrary.simpleMessage("Yêu cầu nhập dữ liệu"),
        "save": MessageLookupByLibrary.simpleMessage("Lưu"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Chọn ngôn ngữ"),
        "signIn": MessageLookupByLibrary.simpleMessage("Đăng Nhập"),
        "signInErrorTitle":
            MessageLookupByLibrary.simpleMessage("Lỗi đăng nhập"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Đăng nhập với Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng Ký"),
        "termRequired": MessageLookupByLibrary.simpleMessage(
            "Hãy đồng ý với các điều khoản và chính sách của chúng tôi"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Điều khoản dịch vụ"),
        "yourCodeOnTheWay": MessageLookupByLibrary.simpleMessage(
            "Mã xác minh đang được gửi đến số điện thoại của bạn"),
        "yourName": MessageLookupByLibrary.simpleMessage("Họ và tên"),
        "yourPhoneVerifying": MessageLookupByLibrary.simpleMessage(
            "Đang xác minh số điện thoại của bạn")
      };
}
