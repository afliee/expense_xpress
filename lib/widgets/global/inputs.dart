import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType { text, number, password }

class Input {
  late BuildContext context;

  Input(this.context);

  static Input of(BuildContext context) => Input(context);

  Widget text({required String label, @required controller, style}) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: style,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.textFieldsColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppStyles.textFieldHorizontalPadding,
            vertical: AppStyles.textFieldVerticalPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldsColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }

  Widget phoneNumber(
      {required label,
      required controller,
      required countryCode,
      TextStyle? style}) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: style ??
            AppStyles.h4.copyWith(
              color: AppColors.textFieldsColor,
              fontWeight: FontWeight.w400,
            ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: label,
          hintText: S.of(context).phoneNumberHint,
          labelStyle: const TextStyle(
            color: AppColors.textFieldsColor,
          ),
          prefixText: countryCode,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppStyles.textFieldHorizontalPadding,
            vertical: AppStyles.textFieldVerticalPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldsColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).phoneNumberException;
          } else if (value.length < 9) {
            return S.of(context).phoneNumberNotValid;
          }
          return null;
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  Widget password({required label, required controller, style}) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: style,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: S.of(context).passwordHint,
          labelStyle: const TextStyle(
            color: AppColors.textFieldsColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppStyles.textFieldHorizontalPadding,
            vertical: AppStyles.textFieldVerticalPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldsColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).passwordException;
          } else if (value.length < Constants.passwordMinLength) {
            return S.of(context).passwordRequired;
          }
          return null;
        },
      ),
    );
  }

  Widget disabled({required label, required controller, style}) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: style,
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.textFieldsColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppStyles.textFieldHorizontalPadding,
            vertical: AppStyles.textFieldVerticalPadding,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.tertiary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldsColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }

  Widget checkbox({required label, required value, required onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoCheckbox(
            value: value ?? false,
            onChanged: onChanged,
            activeColor: AppColors.primary),
        Expanded(
          child: label ?? Container(),
        )
      ],
    );
  }
}
