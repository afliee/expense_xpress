import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/repositories/wallet_repository.dart';
import 'package:expense_xpress/services/models/currency.dart';
import 'package:expense_xpress/services/models/db.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/services/providers/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class UserRepository extends Repository<User, String> {
  // create singleton class
  BuildContext? _context;
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  static final CollectionReference _users = DB.users;
  final WalletRepository _walletRepository = WalletRepository();

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

    if (item.wallets == null || item.wallets!.isEmpty) {
      // create default wallet
      var walletId = const Uuid().v4();
      await _walletRepository.create(Wallet(
        id: walletId,
        userId: item.uid,
        name: S.current.defaultGallery,
        type: WalletType.cash,
        balance: 0,
        initialBalance: 0,
        dueDate: null,
        isDefault: true,
        isNotify: false,
        isDeleted: false,
        unit: CurrencyUnit.vnd,
        limit: null,
        expectedBalance: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    }

    return item;
  }

  @override
  Future<User> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> get(String id) async {
    return _users.doc(id).get().then((DocumentSnapshot documentSnapshot) {
      return User.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
  }

  @override
  Future<List<User>> getAll() async  {
    // TODO: implement getAll
    throw UnimplementedError();
    // return await  _users.get().then((QuerySnapshot querySnapshot) async {
    //   // return querySnapshot.docs.map((DocumentSnapshot documentSnapshot) async {
    //   //   return User.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    //   // }).toList();
    //
    // });
  }

  @override
  Future<User> update(User item) async {
    // TODO: implement update
    // check if document exists
    final DocumentSnapshot documentSnapshot = await _users.doc(item.uid).get();
    if (documentSnapshot.exists) {
      // update document
      await _users.doc(item.uid).update(item.toJson());
      return item;
    }

    return Future.error('User not found');
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

  Future<User> getCurrentUser() async {
    var user = await DB.auth.currentUser;
    if (user == null) {
      return Future.error('User not found');
    }
    return await get(user.uid);
  }
}
