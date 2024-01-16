import 'package:flutter/material.dart';

class AppBarParams {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextTheme? textTheme;
  final bool? primary;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final double? bottomOpacity;

  AppBarParams({
    this.title = const Text(''),
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  });

  AppBarParams copyWith({
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
    bool? automaticallyImplyLeading,
    PreferredSizeWidget? bottom,
    double? elevation,
    Color? backgroundColor,
    Brightness? brightness,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    TextTheme? textTheme,
    bool? primary,
    bool? centerTitle,
    double? titleSpacing,
    double? toolbarOpacity,
    double? bottomOpacity,
  }) {
    return AppBarParams(
      title: title ?? this.title,
      actions: actions ?? this.actions,
      leading: leading ?? this.leading,
      automaticallyImplyLeading: automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      bottom: bottom ?? this.bottom,
      elevation: elevation ?? this.elevation,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      brightness: brightness ?? this.brightness,
      iconTheme: iconTheme ?? this.iconTheme,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      textTheme: textTheme ?? this.textTheme,
      primary: primary ?? this.primary,
      centerTitle: centerTitle ?? this.centerTitle,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
    );
  }

  AppBar get toAppBar {
    return AppBar(
      title: title,
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      bottom: bottom,
      elevation: elevation,
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity ?? 1.0,
      bottomOpacity: bottomOpacity ?? 1.0,
    );
  }
}