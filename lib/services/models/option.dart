import 'package:flutter/material.dart';

class Option {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function? onTap;

  const Option({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });
}