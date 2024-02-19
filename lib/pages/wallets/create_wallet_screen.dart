import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/extension/string_extension.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/functions/wallet_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/services/models/wallet.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:expense_xpress/widgets/global/inputs.dart';
import 'package:expense_xpress/widgets/global/loading_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class CreateWalletScreen extends StatefulWidget {
  final WalletType? type;

  const CreateWalletScreen({super.key, this.type});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  static final String _TAG = '_CreateWalletScreenState';
  final _formKey = GlobalKey<FormState>();
  late final type;
  late final TextEditingController _nameController,
      _balanceController,
      _initialBalanceController;

  late final controllers = {
    'name': _nameController,
    'balance': _balanceController,
    'initialBalance': _initialBalanceController,
  };
  late final User user;
  DateTime? expectedDate;
  String balanceString = '';
  String currentSelectedController = '';
  bool _isUserLoaded = false;
  bool _isNotifyMe = false;
  bool _isSelecting = false;

  @override
  void initState() {
    super.initState();
    type = widget.type;
    _nameController = TextEditingController();
    _balanceController = TextEditingController();
    _initialBalanceController = TextEditingController();
    UserService.getCurrentUser().then((user) {
      setState(() {
        this.user = user;
        _isUserLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S
              .of(context)
              .newWallet,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(AppStyles.padding),
        child: _isUserLoaded ? _buildBody(context) : const Loading(),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        shrinkWrap: true,
        children: [
          Input.of(context).text(
              label: S
                  .of(context)
                  .walletName, controller: _nameController),
          AppStyles.sizedBoxSpace(height: AppStyles.padding),
          Input.of(context).number(
            label: S
                .of(context)
                .balance,
            controller: _balanceController,
            onChanged: (String? value) {
              var string = value ?? '';
              if (string.isEmpty) {
                return;
              }
              balanceString = string;
              var stringConverted = string.toVNDCurrency();
              _balanceController.value = TextEditingValue(
                text: stringConverted,
                selection:
                TextSelection.collapsed(offset: stringConverted.length - 2),
              );
            },
            onTap: () {
              _isSelecting = true;
              currentSelectedController = 'balance';
              // get value from controller
              var string = _balanceController.text;
              if (string.isEmpty) {
                return;
              }
              balanceString = string.currencyToNum().toString();
            },
            onEditingComplete: () {
              _isSelecting = false;
            },
          ),
          AppStyles.sizedBoxSpace(height: AppStyles.padding),
          _buildOptionByType(context),
          Row(
            // wrap content
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    print('$_TAG - subtract -balanceString: $balanceString');
                    if (!_isSelecting) {
                      return;
                    }

                    if (balanceString.isEmpty) {
                      return;
                    }

                    if (currentSelectedController.isEmpty ||
                        controllers[currentSelectedController] == null) {
                      return;
                    }

                    var currentController =
                    controllers[currentSelectedController];
                    var string = balanceString.toNum();
                    if (string == 0) {
                      return;
                    }

                    var stringConverted = (string / 1000).toString();
                    print(stringConverted);
                    if (stringConverted.length < 3) {
                      return;
                    }

                    var currencyString = stringConverted.toVNDCurrency();
                    currentController?.value = TextEditingValue(
                      text: currencyString,
                      selection: TextSelection.collapsed(
                          offset: currencyString.length - 2),
                    );

                    balanceString = stringConverted;
                  },
                  icon: Icon(Icons.remove_rounded,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground),
                  label: Text(
                    '000',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              AppStyles.sizedBoxSpace(width: AppStyles.padding),
              ElevatedButton.icon(
                  onPressed: () {
                    print('$_TAG - add -balanceString: $balanceString');
                    if (!_isSelecting) {
                      return;
                    }

                    if (balanceString.isEmpty) {
                      return;
                    }

                    if (currentSelectedController.isEmpty ||
                        controllers[currentSelectedController] == null) {
                      return;
                    }

                    var currentController =
                    controllers[currentSelectedController];
                    var string = balanceString.toNum();
                    if (string == 0) {
                      return;
                    }

                    var stringConverted = (string * 1000).toString();
                    print(stringConverted);
                    if (stringConverted.length < 3) {
                      return;
                    }

                    var currencyString = stringConverted.toVNDCurrency();
                    currentController?.value = TextEditingValue(
                      text: currencyString,
                      selection: TextSelection.collapsed(
                          offset: currencyString.length - 2),
                    );

                    balanceString = stringConverted;
                  },
                  icon: Icon(
                    Icons.add_rounded,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground,
                  ),
                  label: Text(
                    '000',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
          AppStyles.sizedBoxSpace(height: AppStyles.padding),
          Buttons.of(context).primary(
              child: Text(
                S
                    .of(context)
                    .save,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                AppDialogs.of(context).showActionDialog(
                    title: S
                        .of(context)
                        .saveWallet,
                    message: S
                        .of(context)
                        .areYouSureToContinue,
                    positiveText: S
                        .of(context)
                        .save,
                    onPositivePressed: () async {
                      AppDialogs.of(context).showLoadingDialog();
                      _saveWallet(context);
                    },
                    negativeText: S
                        .of(context)
                        .cancel,
                    onNegativePressed: () {
                      Navigator.of(context).pop();
                    });
              })
        ],
      ),
    );
  }

  _buildOptionByType(BuildContext context) {
    switch (type) {
      case WalletType.cash:
        return Column(
          // macth parent width
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(S
                  .of(context)
                  .notifyMe),
              subtitle: Text(S
                  .of(context)
                  .notifyMeWhenBalanceIsLow),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppStyles.padding / 4,
              ),
              trailing: CupertinoSwitch(
                applyTheme: true,
                value: _isNotifyMe,
                onChanged: (value) {
                  setState(() {
                    _isNotifyMe = value;
                  });
                },
              ),
            ),
          ],
        );
      case WalletType.savings:
        return Column(
          children: <Widget>[
            Input.of(context).number(
                label: S
                    .of(context)
                    .initialBalance,
                controller: _initialBalanceController,
                onChanged: (String? value) {
                  var string = value ?? '';
                  if (string.isEmpty) {
                    return;
                  }
                  var stringConverted = string.toVNDCurrency();
                  _initialBalanceController.value = TextEditingValue(
                    text: stringConverted,
                    selection: TextSelection.collapsed(
                        offset: stringConverted.length - 2),
                  );

                  balanceString = string.currencyToNum().toString();
                },
                onTap: () {
                  _isSelecting = true;
                  currentSelectedController = 'initialBalance';
                  // get value from controller
                  var string = _initialBalanceController.text;
                  if (string.isEmpty) {
                    balanceString = '1';
                    return;
                  }

                  balanceString = string.currencyToNum().toString();
                },
                onEditingComplete: () {
                  _isSelecting = false;
                },
                validator: (initialNumber) {
                  if (initialNumber == null || initialNumber.isEmpty) {
                    return S
                        .of(context)
                        .initialBalanceIsRequired;
                  }

                  var initialBalanceDouble = initialNumber.currencyToDouble();
                  if (initialBalanceDouble <= 0) {
                    return S
                        .of(context)
                        .initialBalanceMustBeGreaterThanZero;
                  }

                  var balance = _balanceController.text.currencyToDouble();
                  if (initialBalanceDouble > balance) {
                    return S
                        .of(context)
                        .initialBalanceMustLessThanBalance;
                  }

                  return null;
                }),
            AppStyles.sizedBoxSpace(height: AppStyles.padding),
            GestureDetector(
              onTap: () {
                // show cupertino date picker
                var body = CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (date) {
                    setState(() {
                      expectedDate = date;
                    });
                  },
                );
                var heightScreen = MediaQuery
                    .of(context)
                    .size
                    .height;
                var height = heightScreen * 0.3;
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) =>
                        Container(
                            height: height,
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .background,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                    AppStyles.bottomSheetBorderRadius),
                                topRight: Radius.circular(
                                    AppStyles.bottomSheetBorderRadius),
                              ),
                            ),
                            child: body));
              },
              child: ListTile(
                title: Text(S
                    .of(context)
                    .expectedDate,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground,
                      fontWeight: FontWeight.w600,
                    )),
                subtitle: Text(S
                    .of(context)
                    .valueYouWantToSave),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.padding / 4,
                ),
                trailing: expectedDate != null
                    ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppStyles.buttonBorderRadius),
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppStyles.padding / 2,
                        vertical: AppStyles.padding / 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppStyles.buttonBorderRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppStyles.padding / 2,
                          vertical: AppStyles.padding / 4),
                      child: Text(
                        AppStyles.dateFormat.format(expectedDate!),
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                    : Icon(
                  Icons.calendar_today,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
            ),
            AppStyles.sizedBoxSpace(height: AppStyles.padding),
            ListTile(
              title: Text(
                S
                    .of(context)
                    .notifyMe,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(S
                  .of(context)
                  .notifyMeWhenBalanceIsLow),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppStyles.padding / 4,
              ),
              trailing: CupertinoSwitch(
                applyTheme: true,
                value: _isNotifyMe,
                onChanged: (value) {
                  setState(() {
                    _isNotifyMe = value;
                  });
                },
              ),
            ),
          ],
        );
      default:
        return const Text('Default');
    }
  }

  _saveWallet(context) async {
    if (!_formKey.currentState!.validate()) {
      AppDialogs.of(context).hideLoadingDialog();
      return;
    }

    print(
        '$_TAG - _saveWallet - name: ${_nameController
            .text} - balance: ${_balanceController
            .text} - initialBalance: ${_initialBalanceController
            .text} - type: $type - isNotifyMe: $_isNotifyMe');
    var wallet = Wallet(
      id: const Uuid().v4(),
      name: _nameController.text,
      balance: _balanceController.text.currencyToDouble(),
      initialBalance: _initialBalanceController.text.currencyToDouble(),
      type: type,
      isNotify: _isNotifyMe,
      userId: user.uid,
      dueDate: expectedDate ?? DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    print('$_TAG - wallet: $wallet');

    try {
      await WalletService.create(wallet);
      AppDialogs.of(context).hideLoadingDialog();
      AppDialogs.of(context).showSnackBar(
        message: S
            .of(context)
            .createWalletSuccess,
      );

      Navigator.of(context).pop();
    } catch (error) {
      print('$_TAG - _saveWallet - error: $error');
      AppDialogs.of(context).hideLoadingDialog();
      AppDialogs.of(context).showSnackBar(
        message: S
            .of(context)
            .errorOccurred,
      );

      Navigator.of(context).pop();
    }
  }
}
