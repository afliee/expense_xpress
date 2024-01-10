enum AuthType { google, phone }

class User {
  final String uid;
  final String? mail;
  final String? phone;
  final String displayName;
  final String photoUrl;
  final AuthType? authType;
  final String locale;
  final DateTime? lastLogin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.uid,
    this.mail,
    this.phone,
    required this.displayName,
    required this.photoUrl,
    this.authType,
    required this.locale,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });
}
