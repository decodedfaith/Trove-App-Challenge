import 'package:flutter/material.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    required this.inputAction,
    required this.autoCorrect,
    required this.obscureText,
    this.labelText,
    this.hintText,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final bool? autoCorrect;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      autocorrect: autoCorrect!,
      obscureText: obscureText!,
      cursorColor: AppColors.cursorColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: displayHeight(context) * 0.0049,
            horizontal: displayWidth(context) * 0.0213),
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppTextStyle.textFieldHintStyle(AppColors.hintTextColor,
            context: context),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(displayWidth(context) * 0.008)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(displayWidth(context) * 0.008)),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
