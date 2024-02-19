import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/extension/string_extension.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/functions/wallet_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/features/wallets/bs_create_wallet.dart';
import 'package:expense_xpress/widgets/features/wallets/bs_create_wallets_option.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  static const String _TAG = 'WalletsScreen';
  late final User _user;
  late final Map<String, dynamic> _wallets;
  late final GlobalKey<_WalletsScreenState> _key;
  late final PageController _walletPageController;
  bool _isUserLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarParams(
          title: Text(
            S.of(context).yourWallets,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                BottomSheetCreateWalletOptions.show(context);
              },
              icon: const Icon(Icons.settings),
            )
          ]).toAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BottomSheetCreateWallet.show(context);
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: _isUserLoaded
          ? Container(
              padding: const EdgeInsets.all(AppStyles.padding),
              child: ListView(
                children: [
                  _buildWallets(context),
                ],
              ).animate().fadeIn(
                    duration: const Duration(milliseconds: 500),
                  ),
            )
          : const Loading(),
    );
  }

  _buildWallets(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (var element in _wallets.entries)
          _buildWalletItem(element.key, element.value),
      ],
    );
  }

  _buildWalletItem(String type, List<Wallet> wallets) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppStyles.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).walletType(type).capitalize(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.start,
          ),
          Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.only(top: AppStyles.margin / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyles.radius),
                color: Theme.of(context).colorScheme.background,
              ),
              padding: const EdgeInsets.all(AppStyles.padding / 2),
              child: PageView.builder(
                padEnds: false,
                controller: _walletPageController,
                itemCount: wallets.length,
                itemBuilder: (context, index) {
                  return _buildWalletItemCard(context, wallets[index]);
                },
              )),
        ],
      ),
    );
  }

  _buildWalletItemCard(BuildContext context, Wallet wallet) {
    var size = MediaQuery.of(context).size;
    var cardWidth = size.width * (3 / 4);

    return Container(
      margin: const EdgeInsets.only(right: AppStyles.margin / 2),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          surfaceTintColor: Theme.of(context).colorScheme.onBackground,
          elevation: 3,
          shadowColor: Theme.of(context).colorScheme.secondary,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.padding / 2,
              vertical: AppStyles.padding / 4,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                  // Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  AppColors.secondary,
                  AppColors.secondary.withOpacity(0.5),
                  Theme.of(context).colorScheme.background.withOpacity(0.2)
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      wallet.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    IconButton(
                        onPressed: () {
                          _showActionSheetActions(context, wallet);
                        },
                        icon: const Icon(Icons.more_vert),
                        padding: EdgeInsets.zero)
                  ],
                ),
                Text(
                  wallet.balance.toString().toVNDCurrency(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                // text stand at the bottom right of column
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        AppStyles.dateFormat.format(wallet.createdAt!),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    // line vertical
                    wallet.dueDate != null
                        ? Expanded(
                            child: Text(
                              S.of(context).dueDate(
                                  AppStyles.dateFormat.format(wallet.dueDate!)),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showActionSheetActions(BuildContext context, wallet) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            S.of(context).cancel,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              // edit
            },
            child: Text(
              S.of(context).edit,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          CupertinoActionSheetAction(
              onPressed: () {
                // delete
              },
              child: Text(
                S.of(context).delete,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _walletPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    UserService.getCurrentUser().then((user) async {
      _user = user;
      _wallets = await WalletService.groupByType(user.uid);
      setState(() {
        _isUserLoaded = true;
        // print('$_TAG: user have ${user.wallets?.length} wallets');
        print('$_TAG: $_wallets');
      });
    });
  }
}
