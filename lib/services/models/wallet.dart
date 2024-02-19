import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_xpress/services/models/currency.dart';
import 'package:expense_xpress/utils/timestamp_converter.dart';

enum WalletType {
  cash,
  bank,
  creditCard,
  debitCard,
  prepaidCard,
  investment,
  loan,
  other,
  savings;

  static WalletType fromJson(int type) {
    return WalletType.values.firstWhere(
      (element) => element.index == type,
      orElse: () => WalletType.cash,
    );
  }

  int toJson() {
    return index;
  }
}

class Wallet {
  final String id;
  final String? userId;
  final String name;
  WalletType type = WalletType.cash;
  late DateTime? dueDate;
  final double? balance;
  final double? initialBalance;
  final double? expectedBalance;
  final double? limit;
  late CurrencyUnit? unit;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late bool? isDeleted;
  late bool? isNotify;
  late bool? isDefault;

  Wallet(
      {required this.id,
      this.userId,
      required this.name,
      required this.type,
      this.dueDate,
      this.balance,
      this.initialBalance,
      this.expectedBalance,
      this.limit,
      this.unit = CurrencyUnit.vnd,
      this.createdAt,
      this.updatedAt,
      this.isDeleted = false,
      this.isNotify,
      this.isDefault = false});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    const TimeStampConverter timestampConverter = TimeStampConverter();
    return Wallet(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      name: json['name'] as String,
      type: WalletType.fromJson(json['type'] as int),
      dueDate: json['dueDate'] == null
          ? null
          : timestampConverter.fromJson(json['dueDate'] as Timestamp),
      balance: (json['balance'] as num?)?.toDouble(),
      initialBalance: (json['initialBalance'] as num?)?.toDouble(),
      expectedBalance: (json['expectedBalance'] as num?)?.toDouble(),
      limit: (json['limit'] as num?)?.toDouble(),
      unit: json['unit'] == null
          ? null
          : CurrencyUnit.fromJson(json['unit']),
      createdAt: json['createdAt'] == null
          ? null
          : timestampConverter.fromJson(json['createdAt'] as Timestamp),
      updatedAt: json['updatedAt'] == null
          ? null
          : timestampConverter.fromJson(json['updatedAt'] as Timestamp),
      isDeleted: json['isDeleted'] as bool?,
      isNotify: json['isNotify'] as bool?,
      isDefault: json['isDefault'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    const TimeStampConverter timestampConverter = TimeStampConverter();
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'type': type.index,
      'dueDate': dueDate == null ? null : timestampConverter.toJson(dueDate!),
      'balance': balance,
      'initialBalance': initialBalance,
      'expectedBalance': expectedBalance,
      'limit': limit,
      'unit': unit == null ? null : unit!.toJson(),
      'createdAt': createdAt == null
          ? null
          : timestampConverter.toJson(createdAt!),
      'updatedAt': updatedAt == null
          ? null
          : timestampConverter.toJson(updatedAt!),
      'isDeleted': isDeleted,
      'isNotify': isNotify,
      'isDefault': isDefault,
    };
  }

  @override
  String toString() {
    return 'Wallet{id: $id, userId: $userId, name: $name, type: $type, dueDate: $dueDate, balance: $balance, initialBalance: $initialBalance, expectedBalance: $expectedBalance, limit: $limit, unit: $unit, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, isNotify: $isNotify, isDefault: $isDefault}';
  }
}
