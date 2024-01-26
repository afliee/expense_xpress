import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/main_screen.dart';
import 'package:expense_xpress/services/extension/string_extension.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/functions/wallet_service.dart';
import 'package:expense_xpress/services/mixins/main_screen_mixin.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/app_bar_params.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
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
      ).toAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          _buildWalletItem(context, element.key, element.value),
      ],
    );
  }

  _buildWalletItem(BuildContext context, String type, List<Wallet> wallets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).walletType(type).capitalize(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          itemCount: wallets.length,
          itemBuilder: (context, index) {
            return _buildWalletItemCard(context, wallets[index]);
          },
        )
      ],
    );
  }

  _buildWalletItemCard(BuildContext context, Wallet wallet) {
    return InkWell(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.wallet_rounded,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              AppStyles.sizedBoxSpace(height: 8),
              Text(
                wallet.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                wallet.balance.toString().toVNDCurrency(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
