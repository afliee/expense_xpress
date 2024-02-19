import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/wallets/bs_create_wallet.dart';
import 'package:flutter/material.dart';

class BottomSheetCreateWalletOptions {
  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppStyles.bottomSheetBorderRadius),
          topRight: Radius.circular(AppStyles.bottomSheetBorderRadius),
        ),
      ),
      builder: (context) => Container(
        height: 200,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: Text(S.of(context).createNewWallet),
              onTap: () {
                Navigator.pop(context);
                BottomSheetCreateWallet.show(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore),
              title: Text(S.of(context).restoreWallet),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, '/restore-wallet');
              },
            ),
          ],
        ),
      ),
    );
  }
}
