enum CurrencyUnit {
  vnd;

  static CurrencyUnit fromJson(String? json) {
    switch (json) {
      case 'vnd':
        return CurrencyUnit.vnd;
      default:
        return CurrencyUnit.vnd;
    }
  }

  String toJson() {
    switch (this) {
      case CurrencyUnit.vnd:
        return 'vnd';
      default:
        return 'vnd';
    }
  }
}