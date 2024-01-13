import 'package:expense_xpress/repositories/user_repository.dart';
import 'package:expense_xpress/services/models/user.dart';

class UserService {
  static final UserRepository _userRepository = UserRepository();
  static Future<User> saveUser(User user) async {
    return await _userRepository.create(user);
  }

  static Future<bool> alreadyExists({required String phoneNumber, Function(bool)? onUserExist}) async {
    var result = await _userRepository.alreadyExists(phoneNumber);

    if (result) {
      onUserExist?.call(result);
      return true;
    }
    return false;
  }
}