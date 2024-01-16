import 'package:flutter/material.dart';

mixin MainScreenStateMixin<T extends StatefulWidget> on State<T> {
  void onPageVisible();
}