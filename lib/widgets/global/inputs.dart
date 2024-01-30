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
        style: style ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.labelLarge?.color,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).requireSomeText;
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
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: label,
          hintText: S.of(context).phoneNumberHint,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.labelLarge?.color,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
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
        style: style ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: S.of(context).passwordHint,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.labelLarge?.color,
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
          labelStyle: style ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
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

  Widget select(
      {required label,
        required value,
      required controller,
      required List<DropdownMenuItem> items,
      required onChanged,
      style}) {
    return Container(
      child: DropdownButtonFormField<dynamic>(
        // styles for dropdown button
        // style for dropdown label
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).requireSomeText;
          }
          return null;
        },

        decoration: InputDecoration(
          labelText: label,
          labelStyle: style ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
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
        value: value,
        items: items,
        onChanged: onChanged,
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
