import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/wallets/create_wallet_screen.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';

class BottomSheetCreateWallet {
  static void show(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.buttonBorderRadius),
            topRight: Radius.circular(AppStyles.buttonBorderRadius),
          ),
        ),
        builder: (context) => Container(
            padding: const EdgeInsets.all(AppStyles.padding),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).createNewWallet,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                // create space between text and textfield
                const SizedBox(height: 10),
                // cash wallet
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const CreateWalletScreen(
                        type: WalletType.cash,
                      )
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppStyles.buttonBorderRadius),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: AppStyles.margin),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppStyles.buttonBorderRadius),
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      title: Text(
                        S.of(context).cashWallet,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      subtitle: Text(
                        S.of(context).cashWalletDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        size: 16,
                      ),
                    ),
                  ),
                ),
                // bank wallet
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const CreateWalletScreen(
                          type: WalletType.bank,
                        )
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(AppStyles.buttonBorderRadius),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: AppStyles.margin),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppStyles.buttonBorderRadius),
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      title: Text(
                        S.of(context).creditCard,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        S.of(context).creditCardDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        size: 16,
                      ),
                    ),
                  ),
                ),
                // saving wallet
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const CreateWalletScreen(
                          type: WalletType.savings,
                        )
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(AppStyles.buttonBorderRadius),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: AppStyles.margin),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppStyles.buttonBorderRadius),
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      title: Text(
                        S.of(context).savingsWallet,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        S.of(context).savingsWalletDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        size: 16,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
