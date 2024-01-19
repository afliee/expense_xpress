import 'package:expense_xpress/services/models/currency.dart';

enum WalletType {
  cash,
  bank,
  creditCard,
  debitCard,
  prepaidCard,
  investment,
  loan,
  other,
}

class Wallet {
  final String id;
  final String name;
  WalletType type = WalletType.cash;
  final DateTime? dueDate;
  final double? balance;
  final double? initialBalance;
  final double? expectedBalance;
  final double? limit;
  final CurrencyUnit? unit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isDeleted;
  final bool? isNotify;
  final bool? isDefault;

  Wallet(
      {required this.id,
      required this.name,
      required this.type,
      this.dueDate,
      this.balance,
      this.initialBalance,
      this.expectedBalance,
      this.limit,
      this.unit,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.isNotify,
      this.isDefault});
}
