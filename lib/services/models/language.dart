import 'package:flutter/material.dart';

class Language {
  final String code;
  final String name;
  final String flag;

  const Language({
    required this.code,
    required this.name,
    required this.flag,
  });

  @override
  String toString() => 'Language(code: $code, name: $name, flag: $flag)';

  Locale get locale {
    return Locale(code);
  }
}