import 'package:expense_xpress/services/functions/wallet_service.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:expense_xpress/utils/timestamp_converter.dart';

enum AuthType {
  google,
  phone;

  String toJson() => name;

  static AuthType fromJson(String json) => AuthType.values.firstWhere(
        (element) => element.name == json,
        orElse: () => AuthType.phone,
      );
}

enum AvatarType {
  google,
  phone,
  gallery,
  defaultGallery,
  camera,
  none;

  String toJson() => name;

  static AvatarType fromJson(String json) => AvatarType.values.firstWhere(
        (element) => element.name == json,
        orElse: () => AvatarType.none,
      );
}

enum UserAttribute {
  mail,
  phone,
  displayName,
  photoUrl,
  authType,
  locale,
  lastLogin,
  createdAt,
  updatedAt
}

class User {
  final TimeStampConverter timestampConverter = const TimeStampConverter();

  final String uid;
  final String? mail;
  final String? phone;
  late String displayName;
  late String photoUrl;
  late AuthType? authType;
  late  AvatarType? avatarType;
  String? locale = LanguageProvider().locale.languageCode;
  DateTime? lastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Wallet>? wallets;

  User({
    required this.uid,
    this.mail,
    this.phone,
    required this.displayName,
    required this.photoUrl,
    required this.authType,
    required this.avatarType,
    this.locale,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
    this.wallets,
  });

  static Future<User> fromJson(Map<String, dynamic> parseMap) async {
    // get list wallets by userId from Future<List<Wallet>> getAllByUserId(String userId) async
    // parseMap['uid'] is userId
    String userId = parseMap['uid'];
    List<Wallet> wallets = [];
    await WalletService.getAllByUserId(userId).then((value) => wallets = value);

    return User(
      uid: parseMap['uid'],
      mail: parseMap['mail'],
      phone: parseMap['phone'],
      displayName: parseMap['displayName'],
      photoUrl: parseMap['photoUrl'],
      authType: AuthType.fromJson(parseMap['authType']),
      avatarType: AvatarType.fromJson(parseMap['avatarType']),
      locale: parseMap['locale'],
      lastLogin:
          parseMap['lastLogin'] == null ? null : parseMap['lastLogin'].toDate(),
      createdAt:
          parseMap['createdAt'] == null ? null : parseMap['createdAt'].toDate(),
      updatedAt:
          parseMap['updatedAt'] == null ? null : parseMap['updatedAt'].toDate(),
      wallets: wallets,
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
      'authType': authType?.toJson(),
      'avatarType': avatarType?.toJson(),
      'locale': locale,
      'lastLogin':
          lastLogin == null ? null : timestampConverter.toJson(lastLogin!),
      'createdAt':
          createdAt == null ? null : timestampConverter.toJson(createdAt!),
      'updatedAt':
          updatedAt == null ? null : timestampConverter.toJson(updatedAt!),
    };
  }
}
