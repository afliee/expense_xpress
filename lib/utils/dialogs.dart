import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  late BuildContext context;

  AppDialogs(this.context);

  static AppDialogs of(context) => AppDialogs(context);

  void showAlertDialog({
    required String title,
    required String message,
    required String positiveText,
    required Function() onPositivePressed,
    String? negativeText,
    Function()? onNegativePressed,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: onPositivePressed,
              child: Text(positiveText),
            ),
            if (negativeText != null)
              CupertinoDialogAction(
                onPressed: onNegativePressed,
                child: Text(negativeText),
              ),
          ],
        );
      },
    );
  }

  void showLoadingDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  void hideLoadingDialog() {
    Navigator.pop(context);
  }

  // show action dialogs
  void showActionDialog({
    required String title,
    required String message,
    required String positiveText,
    required Function() onPositivePressed,
    String? negativeText,
    Function()? onNegativePressed,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: onPositivePressed,
              child: Text(positiveText),
            ),
            if (negativeText != null)
              CupertinoDialogAction(
                onPressed: onNegativePressed,
                child: Text(negativeText),
              ),
          ],
        );
      },
    );
  }

  // show snackbar
  void showSnackBar({
    required String message,
    String? actionText,
    Function()? onActionPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppStyles.buttonBorderRadius)),
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: AppStyles.margin, vertical: AppStyles.margin / 2),
        content: Text(message),
        action: SnackBarAction(
          label: actionText ?? '',
          onPressed: onActionPressed ?? () {},
        ),
      ),
    );
  }
}
