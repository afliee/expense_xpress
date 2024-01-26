import 'package:expense_xpress/repositories/wallet_repository.dart';
import 'package:expense_xpress/services/models/wallet.dart';

class WalletService {
  static final WalletRepository _walletRepository = WalletRepository();

  static Future<List<Wallet>> getAllByUserId(String userId) async {
    return await _walletRepository.getAllByUserId(userId);
  }

  static Future<Map<String, dynamic>> groupByType(String userId) async {
    return await _walletRepository.groupByType(userId);
  }
}