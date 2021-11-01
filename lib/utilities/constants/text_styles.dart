import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';

class AppTextStyle {
  static double size12(BuildContext context) {
    return displayWidth(context) * 0.032;
  }

  static double size14(BuildContext context) {
    return displayWidth(context) * 0.0373;
  }

  static double size15(BuildContext context) {
    return displayWidth(context) * 0.04;
  }

  static double size16(BuildContext context) {
    return displayWidth(context) * 0.0426;
  }

  static double size19(BuildContext context) {
    return displayWidth(context) * 0.0506;
  }

  static double size20(BuildContext context) {
    return displayWidth(context) * 0.0533;
  }

  static double size48(BuildContext context) {
    return displayWidth(context) * 0.128;
  }

//fontweights
  static const FontWeight _normalWeight = FontWeight.w400;
  static const FontWeight _normalWeightw500 = FontWeight.w500;
  static const FontWeight _boldWeight = FontWeight.w700;

  //?Text Styles go below
  //colorSizeFontWeight Textstyles
  static TextStyle darkGreyNormalSize12(BuildContext context) {
    return _base(size12(context), _normalWeight, AppColors.textDark);
  }

  static TextStyle darkGreyBoldSize12(BuildContext context) {
    return _base(size12(context), _boldWeight, AppColors.textDark);
  }

  static TextStyle lightGreyNormalSize12(BuildContext context) {
    return _base(size12(context), _normalWeight, AppColors.textLight10);
  }

  static TextStyle lightGreyNormalSize14(BuildContext context) {
    return _base(size14(context), _normalWeight, AppColors.textLight10);
  }

  static TextStyle darkGreyNormalSize14(BuildContext context) {
    return _base(size14(context), _normalWeight, AppColors.textDark);
  }

  static TextStyle blueNormalSize14(BuildContext context) {
    return _base(size14(context), _normalWeight, AppColors.blueColor);
  }

  static TextStyle whiteBoldSize16(BuildContext context) {
    return _base(size14(context), _normalWeight, AppColors.blueColor);
  }

  static TextStyle blueNormalSize16(BuildContext context) {
   return _base(size16(context), _normalWeight, AppColors.blueColor);
  }

  static TextStyle darkGreyBoldSize20(BuildContext context) {
    return _base(size20(context), _boldWeight, AppColors.textDark);
  }

  static TextStyle darkGreyBoldSize16(BuildContext context) {
    return _base(size16(context), _boldWeight, AppColors.textDark);
  }

  //!End

  //fontSizeWeight Textstyles
  static TextStyle normalSize20(BuildContext context) {
  return _custom(size20(context), _normalWeightw500,);

  }
  //! End

  //Googlefonts textStyle

  static TextStyle zuriAppBarWordLogo = GoogleFonts.lato(
    fontSize: 18.08,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
    height: 1,
    letterSpacing: 2.5,
  );
  static TextStyle termAndConditionStyle(context) {
    return GoogleFonts.lato(
      fontSize: size12(context),
      color: AppColors.blueColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.blueColor,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: displayWidth(context) *0.0026,
    );
  }

  //custom TextStyle
  static TextStyle longButtonStyle(Color? color,
      {required BuildContext context}) {
    return baseStyle(
        fontSize: size14(context), fontWeight: _normalWeight, color: color);
  }

  static TextStyle textFieldHintStyle(Color? color,
      {required BuildContext context}) {
    return baseStyle(
        fontSize: size15(context), fontWeight: _normalWeight, color: color);
  }

  //#base style
  static TextStyle _base(
    double size,
    FontWeight? fontWeight,
    Color? color,
  ) {
    return baseStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle baseStyle({
    double fontSize = 13,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600],
    );
  }

  static TextStyle _custom(
    double size,
    FontWeight? fontWeight,
  ) {
    return GoogleFonts.lato(
      fontSize: size, 
      fontWeight: fontWeight
    );
  }
}
