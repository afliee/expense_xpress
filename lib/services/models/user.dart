import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:expense_xpress/utils/timestamp_converter.dart';

enum AuthType { google, phone }
enum UserAttribute { mail, phone, displayName, photoUrl, authType, locale, lastLogin, createdAt, updatedAt }

class User {
  final TimeStampConverter timestampConverter = const TimeStampConverter();
  final String uid;
  final String? mail;
  final String? phone;
  final String displayName;
  final String photoUrl;
  final String? authType;
  String? locale = LanguageProvider().locale.languageCode;
  DateTime? lastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.uid,
    this.mail,
    this.phone,
    required this.displayName,
    required this.photoUrl,
    this.authType,
    this.locale,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> parseMap) {
    return User(
      uid: parseMap['uid'],
      mail: parseMap['mail'],
      phone: parseMap['phone'],
      displayName: parseMap['displayName'],
      photoUrl: parseMap['photoUrl'],
      authType: parseMap['authType'],
      locale: parseMap['locale'],
      lastLogin: parseMap['lastLogin'] == null ? null : parseMap['lastLogin'].toDate(),
      createdAt: parseMap['createdAt'] == null ? null : parseMap['createdAt'].toDate(),
      updatedAt: parseMap['updatedAt'] == null ? null : parseMap['updatedAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    // parse time to timestamp
    return {
      'uid': uid,
      'mail': mail,
      'phone': phone,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'authType': authType,
      'locale': locale,
      'lastLogin': lastLogin == null ? null : timestampConverter.toJson(lastLogin!),
      'createdAt': createdAt == null ? null : timestampConverter.toJson(createdAt!),
      'updatedAt': updatedAt == null ? null : timestampConverter.toJson(updatedAt!),
    };
  }
}
