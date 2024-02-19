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

  static String m1(categoryName) => "Chọn hành động cho \'${categoryName}\'";

  static String m2(date) => "Hết hạn: ${date}";

  static String m3(seconds) =>
      "Vui lòng đợi ${seconds} giây để gửi lại mã xác minh";

  static String m4(walletType) => "ví ${walletType}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addNewCategory":
            MessageLookupByLibrary.simpleMessage("Thêm danh mục mới"),
        "addNewTransaction":
            MessageLookupByLibrary.simpleMessage("Thêm giao dịch mới"),
        "addNewWallet": MessageLookupByLibrary.simpleMessage("Thêm ví mới"),
        "agreeToTerms":
            MessageLookupByLibrary.simpleMessage("Tôi đồng ý với các "),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Bạn đã có tài khoản?"),
        "alreadyInUse": MessageLookupByLibrary.simpleMessage("đã được sử dụng"),
        "alreadySignedUp":
            MessageLookupByLibrary.simpleMessage("Bạn đã đăng ký"),
        "and": MessageLookupByLibrary.simpleMessage(" và "),
        "areYouSureToContinue": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc chắn muốn tiếp tục?"),
        "balance": MessageLookupByLibrary.simpleMessage("Số dư"),
        "bankAccount":
            MessageLookupByLibrary.simpleMessage("Tài khoản ngân hàng"),
        "beauty": MessageLookupByLibrary.simpleMessage("Làm đẹp"),
        "bills": MessageLookupByLibrary.simpleMessage("Hóa đơn"),
        "bonus": MessageLookupByLibrary.simpleMessage("Thưởng"),
        "borrowedMoney": MessageLookupByLibrary.simpleMessage("Tiền vay"),
        "budgets": MessageLookupByLibrary.simpleMessage("Ngân sách"),
        "bugdet": MessageLookupByLibrary.simpleMessage("Ngân sách"),
        "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
        "cash": MessageLookupByLibrary.simpleMessage("Tiền mặt"),
        "cashFlow": MessageLookupByLibrary.simpleMessage("Dòng tiền"),
        "cashWallet": MessageLookupByLibrary.simpleMessage("Ví tiền mặt"),
        "cashWalletDescription":
            MessageLookupByLibrary.simpleMessage("Ví tiền mặt của bạn"),
        "categories": MessageLookupByLibrary.simpleMessage("Danh mục"),
        "categoryAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Danh mục đã tồn tại"),
        "categoryGroup": MessageLookupByLibrary.simpleMessage("Nhóm danh mục"),
        "categoryName": MessageLookupByLibrary.simpleMessage("Tên danh mục"),
        "checkingYourPhone": m0,
        "chooseAction": MessageLookupByLibrary.simpleMessage("Chọn hành động"),
        "chooseActionFor": m1,
        "chooseFromGallery":
            MessageLookupByLibrary.simpleMessage("Chọn từ thư viện"),
        "choosePhotoFromUsGallery": MessageLookupByLibrary.simpleMessage(
            "Chọn ảnh từ thư viện của chúng tôi"),
        "choosePhotoFromYourGallery": MessageLookupByLibrary.simpleMessage(
            "Chọn ảnh từ thư viện của bạn"),
        "clothing": MessageLookupByLibrary.simpleMessage("Quần áo"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "createCategoryFailed":
            MessageLookupByLibrary.simpleMessage("Tạo danh mục thất bại"),
        "createCategorySuccess":
            MessageLookupByLibrary.simpleMessage("Tạo danh mục thành công"),
        "createNewWallet": MessageLookupByLibrary.simpleMessage("Thêm ví mới"),
        "createWalletFailed":
            MessageLookupByLibrary.simpleMessage("Tạo ví thất bại"),
        "createWalletSuccess":
            MessageLookupByLibrary.simpleMessage("Tạo ví thành công"),
        "credential":
            MessageLookupByLibrary.simpleMessage("Thông tin đăng nhập"),
        "creditCard": MessageLookupByLibrary.simpleMessage("Thẻ tín dụng"),
        "creditCardDescription": MessageLookupByLibrary.simpleMessage(
            "Theo dõi các khoản thanh toán thẻ tín dụng của bạn"),
        "currency": MessageLookupByLibrary.simpleMessage("Tiền tệ"),
        "dark": MessageLookupByLibrary.simpleMessage("Tối"),
        "debtAndLoan": MessageLookupByLibrary.simpleMessage("Nợ/ Cho vay"),
        "defaultGallery":
            MessageLookupByLibrary.simpleMessage("Thư viện mặc định"),
        "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
        "deleteCategory": MessageLookupByLibrary.simpleMessage("Xóa danh mục"),
        "deleteCategoryMessage": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc chắn muốn xóa danh mục này?"),
        "deleteCategorySuccess":
            MessageLookupByLibrary.simpleMessage("Xóa danh mục thành công"),
        "didntReceiveCode": MessageLookupByLibrary.simpleMessage(
            "Không nhận được mã xác minh? Gửi lại"),
        "display": MessageLookupByLibrary.simpleMessage("Hiển thị"),
        "displayName": MessageLookupByLibrary.simpleMessage("Tên hiển thị"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Bạn chưa có tài khoản?"),
        "dueDate": m2,
        "edit": MessageLookupByLibrary.simpleMessage("Chỉnh sửa"),
        "editCategorySuccess": MessageLookupByLibrary.simpleMessage(
            "Chỉnh sửa danh mục thành công"),
        "editProfile": MessageLookupByLibrary.simpleMessage("Chỉnh sửa hồ sơ"),
        "education": MessageLookupByLibrary.simpleMessage("Giáo dục"),
        "enterCode": MessageLookupByLibrary.simpleMessage("Nhập mã xác minh"),
        "entertainment": MessageLookupByLibrary.simpleMessage("Giải trí"),
        "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
        "errorOccurred": MessageLookupByLibrary.simpleMessage("Đã xảy ra lỗi"),
        "expectedDate":
            MessageLookupByLibrary.simpleMessage("Giá trị mong đợi là ngày"),
        "expectedNumber":
            MessageLookupByLibrary.simpleMessage("Giá trị mong đợi là số"),
        "expectedNumberIsRequired": MessageLookupByLibrary.simpleMessage(
            "Giá trị mong đợi là bắt buộc"),
        "expectedNumberMustBeGreaterThanZero":
            MessageLookupByLibrary.simpleMessage(
                "Giá trị mong đợi phải lớn hơn 0"),
        "expectedNumberMustGreaterThanBalanceAndInitialBalance":
            MessageLookupByLibrary.simpleMessage(
                "Giá trị mong đợi phải lớn hơn số dư và số dư ban đầu"),
        "expectedNumberMustGreaterThanZero":
            MessageLookupByLibrary.simpleMessage(
                "Giá trị mong đợi phải lớn hơn 0"),
        "expense": MessageLookupByLibrary.simpleMessage("Chi tiêu"),
        "food": MessageLookupByLibrary.simpleMessage("Ăn uống"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "furniture": MessageLookupByLibrary.simpleMessage("Nội thất"),
        "gift": MessageLookupByLibrary.simpleMessage("Quà tặng"),
        "health": MessageLookupByLibrary.simpleMessage("Sức khỏe"),
        "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
        "history": MessageLookupByLibrary.simpleMessage("Lịch sử"),
        "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "homeRepair": MessageLookupByLibrary.simpleMessage("Sửa chữa nhà cửa"),
        "houseHoldAppliances":
            MessageLookupByLibrary.simpleMessage("Thiết bị gia dụng"),
        "houseHoldServices":
            MessageLookupByLibrary.simpleMessage("Dịch vụ hộ gia đình"),
        "household": MessageLookupByLibrary.simpleMessage("Hộ gia đình"),
        "income": MessageLookupByLibrary.simpleMessage("Thu nhập"),
        "initialBalance": MessageLookupByLibrary.simpleMessage("Số dư ban đầu"),
        "initialBalanceIsRequired":
            MessageLookupByLibrary.simpleMessage("Số dư ban đầu là bắt buộc"),
        "initialBalanceMustBeGreaterThanZero":
            MessageLookupByLibrary.simpleMessage(
                "Số dư ban đầu phải lớn hơn 0"),
        "initialBalanceMustLessThanBalance":
            MessageLookupByLibrary.simpleMessage(
                "Số dư ban đầu phải nhỏ hơn số dư"),
        "insurance": MessageLookupByLibrary.simpleMessage("Bảo hiểm"),
        "interestMoney": MessageLookupByLibrary.simpleMessage("Tiền lãi"),
        "invalidCode":
            MessageLookupByLibrary.simpleMessage("Mã xác minh không hợp lệ"),
        "investment": MessageLookupByLibrary.simpleMessage("Đầu tư"),
        "joinDate": MessageLookupByLibrary.simpleMessage("Ngày tham gia"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "lastLogin": MessageLookupByLibrary.simpleMessage("Lần đăng nhập cuối"),
        "lentMoney": MessageLookupByLibrary.simpleMessage("Tiền cho vay"),
        "letStartByCreatingNewBudget": MessageLookupByLibrary.simpleMessage(
            "Hãy bắt đầu với việc tạo ngân sách mới"),
        "light": MessageLookupByLibrary.simpleMessage("Sáng"),
        "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "maybeIssueWithThisMethod": MessageLookupByLibrary.simpleMessage(
            "Có vẻ phương thực hiện tại đang gặp vấn đề\n Hãy thử lại sau"),
        "monthly": MessageLookupByLibrary.simpleMessage("Tháng"),
        "newBudget": MessageLookupByLibrary.simpleMessage("Thêm mới"),
        "newWallet": MessageLookupByLibrary.simpleMessage("Thêm ví mới"),
        "noData": MessageLookupByLibrary.simpleMessage("Không có dữ liệu"),
        "notValidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Số điện thoại không hợp lệ"),
        "notifyMe": MessageLookupByLibrary.simpleMessage("Thông báo cho tôi"),
        "notifyMeWhenBalanceIsLow": MessageLookupByLibrary.simpleMessage(
            "Thông báo cho tôi khi số dư ví thấp"),
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
        "otherExpense": MessageLookupByLibrary.simpleMessage("Chi phí khác"),
        "otherIncome": MessageLookupByLibrary.simpleMessage("Thu nhập khác"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passwordException":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu của bạn"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Hãy nhập mật khẩu của bạn"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu chứa ít nhất 8 ký tự"),
        "personal": MessageLookupByLibrary.simpleMessage("Cá nhân"),
        "personalItems": MessageLookupByLibrary.simpleMessage("Đồ cá nhân"),
        "pet": MessageLookupByLibrary.simpleMessage("Thú cưng"),
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
        "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
        "profileSettings":
            MessageLookupByLibrary.simpleMessage("Cài đặt hồ sơ"),
        "rent": MessageLookupByLibrary.simpleMessage("Tiền thuê nhà"),
        "repayDebt": MessageLookupByLibrary.simpleMessage("Trả nợ"),
        "requireSomeText":
            MessageLookupByLibrary.simpleMessage("Yêu cầu nhập dữ liệu"),
        "resendCode":
            MessageLookupByLibrary.simpleMessage("Gửi lại mã xác minh"),
        "restoreWallet": MessageLookupByLibrary.simpleMessage("Khôi phục ví"),
        "salary": MessageLookupByLibrary.simpleMessage("Lương"),
        "save": MessageLookupByLibrary.simpleMessage("Lưu"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Lưu thay đổi"),
        "saveWallet": MessageLookupByLibrary.simpleMessage("Lưu ví"),
        "savings": MessageLookupByLibrary.simpleMessage("Tiết kiệm"),
        "savingsWallet": MessageLookupByLibrary.simpleMessage("Ví tiết kiệm"),
        "savingsWalletDescription":
            MessageLookupByLibrary.simpleMessage("Ví tiết kiệm của bạn"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Chọn ngôn ngữ"),
        "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "shopping": MessageLookupByLibrary.simpleMessage("Mua sắm"),
        "signIn": MessageLookupByLibrary.simpleMessage("Đăng Nhập"),
        "signInErrorTitle":
            MessageLookupByLibrary.simpleMessage("Lỗi đăng nhập"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Đăng nhập với Google"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng Ký"),
        "somethingWentWrongInProcess": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi trong quá trình xử lý"),
        "success": MessageLookupByLibrary.simpleMessage("Thành công"),
        "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("Chụp ảnh"),
        "takePhotoWithYourCamera": MessageLookupByLibrary.simpleMessage(
            "Chụp ảnh với máy ảnh của bạn"),
        "termRequired": MessageLookupByLibrary.simpleMessage(
            "Hãy đồng ý với các điều khoản và chính sách của chúng tôi"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Điều khoản dịch vụ"),
        "thisMethodCurrentlyNotSupported": MessageLookupByLibrary.simpleMessage(
            "Phương thức này hiện không được hỗ trợ"),
        "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
            "Quá nhiều lần thử! Hãy thử lại sau"),
        "transactions": MessageLookupByLibrary.simpleMessage("Giao dịch"),
        "transportation": MessageLookupByLibrary.simpleMessage("Giao thông"),
        "travel": MessageLookupByLibrary.simpleMessage("Du lịch"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "unKnown": MessageLookupByLibrary.simpleMessage("Không xác định"),
        "valueYouWantToSave":
            MessageLookupByLibrary.simpleMessage("Ngày bạn muốn hoàn thành"),
        "verificationCodeRequired":
            MessageLookupByLibrary.simpleMessage("Yêu cầu mã xác minh"),
        "verificationTitle":
            MessageLookupByLibrary.simpleMessage("Xác minh số điện thoại"),
        "verify": MessageLookupByLibrary.simpleMessage("Xác minh"),
        "view": MessageLookupByLibrary.simpleMessage("Xem"),
        "viewAll": MessageLookupByLibrary.simpleMessage("Xem tất cả"),
        "waitToResendCode": m3,
        "walletBalance": MessageLookupByLibrary.simpleMessage("Số dư ví"),
        "walletBalanceRequired":
            MessageLookupByLibrary.simpleMessage("Số dư ví là bắt buộc"),
        "walletCurrency": MessageLookupByLibrary.simpleMessage("Tiền tệ"),
        "walletName": MessageLookupByLibrary.simpleMessage("Tên ví"),
        "walletNameRequired":
            MessageLookupByLibrary.simpleMessage("Tên ví là bắt buộc"),
        "walletType": m4,
        "weSentVerificationCode": MessageLookupByLibrary.simpleMessage(
            "Chúng tôi đã gửi mã xác minh đến số điện thoại "),
        "weekly": MessageLookupByLibrary.simpleMessage("Tuần"),
        "yearly": MessageLookupByLibrary.simpleMessage("Năm"),
        "youCanCheckYourPhone": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể kiểm tra điện thoại của mình để xác minh mã xác minh"),
        "youCanEditYourProfileWithUsOptions":
            MessageLookupByLibrary.simpleMessage(
                "Bạn có thể chỉnh sửa hồ sơ của mình với các tùy chọn sau"),
        "yourCamera": MessageLookupByLibrary.simpleMessage("Máy ảnh của bạn"),
        "yourCanPickIcon": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể chọn biểu tượng cho danh mục của mình"),
        "yourCodeOnTheWay": MessageLookupByLibrary.simpleMessage(
            "Mã xác minh đang được gửi đến số điện thoại của bạn"),
        "yourGallery": MessageLookupByLibrary.simpleMessage("Thư viện của bạn"),
        "yourName": MessageLookupByLibrary.simpleMessage("Họ và tên"),
        "yourPhoneVerifying": MessageLookupByLibrary.simpleMessage(
            "Đang xác minh số điện thoại của bạn"),
        "yourWallets": MessageLookupByLibrary.simpleMessage("Ví của bạn")
      };
}
