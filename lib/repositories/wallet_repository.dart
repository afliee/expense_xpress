import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/repositories/repository.dart';
import 'package:expense_xpress/services/models/db.dart';

class WalletRepository extends Repository<WalletRepository, String> {
  static final WalletRepository _instance = WalletRepository._internal();
  factory WalletRepository() => _instance;
  WalletRepository._internal();

  static final CollectionReference _wallets = DB.wallets;
  @override
  Future<WalletRepository> create(WalletRepository item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<WalletRepository> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<WalletRepository> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<WalletRepository>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<WalletRepository> update(WalletRepository item) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}