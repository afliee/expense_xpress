import 'dart:io';

import 'package:expense_xpress/repositories/user_repository.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserService {
  static final UserRepository _userRepository = UserRepository();

  static Future<User> saveUser(User user) async {
    return await _userRepository.create(user);
  }

  static Future<User> updateUser(User user) async {
    return await _userRepository.update(user);
  }

  static Future<bool> alreadyExists(
      {required String phoneNumber, Function(bool)? onUserExist}) async {
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

  static ImageProvider<Object> getPhotoUrl(User user) {
    switch (user.avatarType) {
      case AvatarType.google:
        return NetworkImage(user.photoUrl ?? '');
      case AvatarType.gallery:
      case AvatarType.camera:
        // in this case photoUrl is the path of the image in the device
        // get file from path
        try {
          return FileImage(File(user.photoUrl));
        } catch (e) {
          print(e);
          return AssetImage(ImagesAsset.defaultAvatar);
        }
      case AvatarType.phone:
      case AvatarType.defaultGallery:
        return AssetImage(user.photoUrl ?? '');
      default:
        return AssetImage(ImagesAsset.defaultAvatar);
    }
  }
}
