import 'package:expense_xpress/repositories/user_repository.dart';
import 'package:expense_xpress/services/models/user.dart';

class UserService {
  static final UserRepository _userRepository = UserRepository();
  static Future<User> saveUser(User user) async {
    return await _userRepository.create(user);
  }

  static Future<User> updateUser(User user) async {
    return await _userRepository.update(user);
  }

  static Future<bool> alreadyExists({required String phoneNumber, Function(bool)? onUserExist}) async {
    var result = await _userRepository.alreadyExists(phoneNumber);

    if (result) {
      onUserExist?.call(result);
      return true;
    }
    return false;
  }

  static Future<User> getCurrentUser() async {
    return await _userRepository.getCurrentUser();
  }

  static Future<User> getUser(String uid) async {
    return await _userRepository.get(uid);
  }
}