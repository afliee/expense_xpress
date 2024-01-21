import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons {
  late BuildContext _context;

  static Buttons of(BuildContext context) {
    return Buttons().._context = context;
  }

  Widget primary({required Widget child, required Function() onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        elevation: 5,
        shadowColor: Theme.of(_context).shadowColor,
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

  static Widget secondary(
      {required Widget child, required Function() onPressed}) {
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

  Widget stroke(
      {required Widget child,
      required Function() onPressed,
      EdgeInsets? padding,
      Color? color}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color ?? Theme.of(_context).colorScheme.background,
        // shadowColor: Colors.grey,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: AppStyles.buttonPadding,
              vertical: AppStyles.buttonPadding,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
          side: BorderSide(
            color: Theme.of(_context).colorScheme.onSurface,
            width: 1,
          ),
        ),
      ),
      child: child,
    );
  }

  Widget disabled(
      {required Widget child,
      required Function() onPressed,
      EdgeInsets? padding,
      Color? color}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: color ?? Theme.of(_context).colorScheme.surfaceVariant,
        shadowColor: Colors.grey,
        padding: padding ??
            const EdgeInsets.symmetric(
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
