import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/services/models/db.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';

class UserRepository extends Repository<User, String> {
  // create singleton class
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() => _instance;

  UserRepository._internal();

  static final CollectionReference _users = DB.users;

  @override
  Future<User> create(User item) async {
    item.locale = LanguageProvider().locale.toString();

    // check if document exists
    final DocumentSnapshot documentSnapshot = await _users.doc(item.uid).get();
    if (documentSnapshot.exists) {
      // update document
      await _users.doc(item.uid).update(item.toJson());
      return item;
    }

    final DocumentReference documentReference = _users.doc(item.uid);
    await documentReference.set(item.toJson());
    return item;
  }

  @override
  Future<User> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> get(String id) {
    return _users.doc(id).get().then((DocumentSnapshot documentSnapshot) {
      return User.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
  }

  @override
  Future<List<User>> getAll() {
    // TODO: implement getAll
    return _users.get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
        return User.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  @override
  Future<User> update(User item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<bool> alreadyExists(String phoneNumber) {
    return _users
        .where(UserAttribute.phone.name, isEqualTo: phoneNumber)
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<dynamic> users =
          querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
        // print documentSnapshot.data();
        return User.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      }).toList();
      return users.isNotEmpty;
    });
  }
}
