import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final bool? isFromOnBoarding;
  const ForgotPasswordScreen({super.key, this.isFromOnBoarding});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isFromOnBoarding = false;

  @override
  void initState() {
    super.initState();
    _isFromOnBoarding = widget.isFromOnBoarding ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI(context, _isFromOnBoarding);
  }
}

Widget _buildUI(context, isFromOnBoarding) {
  return Scaffold(
    backgroundColor: AppColors.background,
    appBar: AppBar(
      elevation: 0,
      // if isfromonboarding is true then show back button
      leading: isFromOnBoarding
          ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      )
          : null,
      title: Text(
          S.of(context).signUp,
          style: AppStyles.h3.copyWith(
            color: AppColors.appBarColor,
            fontWeight: FontWeight.w600,
          )
      ),
      centerTitle: true,
    ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
    ),
  );
}
