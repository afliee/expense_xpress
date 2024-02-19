import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/services/models/db.dart';
import 'package:expense_xpress/services/models/wallet.dart';

class WalletRepository extends Repository<Wallet, String> {
  static final WalletRepository _instance = WalletRepository._internal();

  factory WalletRepository() => _instance;

  WalletRepository._internal();

  static final CollectionReference _wallets = DB.wallets;

  @override
  Future<Wallet> create(Wallet item) async {
    // TODO: implement create
    CollectionReference userWallets =
        _wallets.doc(item.userId).collection('wallets');
    DocumentReference documentReference = userWallets.doc(item.id);
    await documentReference.set(item.toJson());
    return item;
  }

  @override
  Future<Wallet> delete(String id) {
    // TODO: implement delete
    var now = DateTime.now();
    throw UnimplementedError();
  }

  @override
  Future<Wallet> get(String id) async {
    try {
      CollectionReference userWallets = _wallets.doc(id).collection('wallets');
      DocumentSnapshot wallet = await userWallets.doc(id).get();
      if (wallet.exists) {
        return Wallet.fromJson(wallet.data() as Map<String, dynamic>);
      }
      throw Exception('Wallet not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Wallet>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Wallet> update(Wallet item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Wallet>> getAllByUserId(String userId) async {
    List<Wallet> wallets = [];
    QuerySnapshot querySnapshot =
        await _wallets.doc(userId).collection('wallets').get();
    for (var element in querySnapshot.docs) {
      wallets.add(Wallet.fromJson(element.data() as Map<String, dynamic>));
    }
    return wallets;
  }

  Future<Map<String, dynamic>> groupByType(String userId) async {
    Map<String, dynamic> wallets = {};

    QuerySnapshot querySnapshot =
        await _wallets.doc(userId).collection('wallets').get();
    for (var element in querySnapshot.docs) {
      Wallet wallet = Wallet.fromJson(element.data() as Map<String, dynamic>);
      if (wallets.containsKey(wallet.type.name)) {
        wallets[wallet.type.name].add(wallet);
      } else {
        wallets[wallet.type.name] = [wallet];
      }
    }

    return wallets;
  }
}
