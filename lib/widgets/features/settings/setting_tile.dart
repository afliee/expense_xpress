import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/models/option.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final Option option;

  const SettingTile({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // style for ListTile
      contentPadding: const EdgeInsets.all(0),
      focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      titleAlignment: ListTileTitleAlignment.threeLine,
      leading: option.leading,
      title: Text(option.title),
      trailing: option.trailing,
      onTap: () {
        if (option.onTap != null) {
          option.onTap!();
        }
      },
    );
  }
}
