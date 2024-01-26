import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/profile/wallets_screen.dart';
import 'package:expense_xpress/pages/select_language_screen.dart';
import 'package:expense_xpress/services/models/option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsGroup {
  static const String _TAG = 'SettingsGroup';
  late BuildContext _context;

  static SettingsGroup of(BuildContext context) {
    return SettingsGroup._(context);
  }

  SettingsGroup._(BuildContext context) {
    _context = context;
  }

  // export constant variables with context
  Map<String, dynamic> get settings {
    if (!_context.mounted || _context == null) {
      print('$_TAG: context is null or not mounted');
      return {};
    }
    return {
      S.of(_context).personal: [
        Option(
            title: S.of(_context).yourWallets,
            subtitle: '',
            leading: const Icon(Icons.wallet),
            onTap: () {
              print('$_TAG: yourWallets');
              Navigator.of(_context).push(
                  MaterialPageRoute(builder: (_) => const WalletsScreen()));
            }),
        Option(
            title: S.of(_context).categories,
            subtitle: '',
            leading: const Icon(Icons.category),
            onTap: () {
              print('$_TAG: categories');
            }),
      ],
      S.of(_context).display: [
        Option(
          title: S.of(_context).language,
          subtitle: '',
          leading: const Icon(Icons.language),
          onTap: () {
            print('$_TAG: language');
            Navigator.of(_context).push(MaterialPageRoute(
                builder: (_) => const LanguageSelectionScreen()));
          },
        ),
      ]
    };
  }
}
