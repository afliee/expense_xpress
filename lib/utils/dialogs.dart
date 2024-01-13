import 'package:flutter/cupertino.dart';

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
}
