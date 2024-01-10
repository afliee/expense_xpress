import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons {
  static Widget primary({required Widget child, required Function() onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        elevation: 5,
        shadowColor: Colors.grey,
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.buttonPadding,
          vertical: AppStyles.buttonPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
        ),
      ),
      child: child,
    );
  }

  static Widget secondary({required Widget child, required Function() onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.buttonSecondary,
        elevation: 5,
        shadowColor: Colors.grey,
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.buttonPadding,
          vertical: AppStyles.buttonPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
        ),
      ),
      child: child,
    );
  }
}