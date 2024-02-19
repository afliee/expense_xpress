enum BudgetOption {
  weekly,
  monthly,
  yearly;

  static BudgetOption fromJson(String value) {
    switch (value) {
      case 'weekly':
        return BudgetOption.weekly;
      case 'monthly':
        return BudgetOption.monthly;
      case 'yearly':
        return BudgetOption.yearly;
      default:
        return BudgetOption.weekly;
    }
  }

  String toJson() {
    switch (this) {
      case BudgetOption.weekly:
        return 'weekly';
      case BudgetOption.monthly:
        return 'monthly';
      case BudgetOption.yearly:
        return 'yearly';
    }
  }
}

class Budget {
  final String id;
  String name = '';
  double amount;
  BudgetOption option;
  DateTime? startDate;
  DateTime? endDate;

  Budget({
    required this.id,
    required this.name,
    this.amount = 0,
    this.option = BudgetOption.weekly,
    this.startDate,
    this.endDate,
  }) {
    startDate ??= DateTime.now();
    endDate ??= DateTime.now();
  }
}
