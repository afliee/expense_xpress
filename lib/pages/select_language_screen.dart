import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/lang/l10n.dart';
import 'package:expense_xpress/services/models/language.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }
}

Widget _buildLanguageItem(BuildContext context,Language language) {
  return InkWell(
    child: Container(
      margin:const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding:const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.quaternary.withOpacity(0.1),
            blurRadius: 8,
            offset:const Offset(0, 4),
          ),
        ]
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              language.flag
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              language.name,
              style: AppStyles.h3.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]
      ),
    ),
  );
}

// ui builder
Widget _buildUI(BuildContext context) {
  var _languages = Languages.all;
  return Scaffold(
    backgroundColor: AppColors.background,
    appBar: AppBar(
      title: Text(
        AppLocalizations.of(context)?.language ?? '',
        style: AppStyles.h2.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                return _buildLanguageItem(context, _languages[index]);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
