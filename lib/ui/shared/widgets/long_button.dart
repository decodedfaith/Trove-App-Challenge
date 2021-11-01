import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';

class LongButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color? labelColor;
  final Color? outlineColor;
  final double? height;
  final double? width;

  const LongButton({
    Key? key,
    this.labelColor,
    required this.onPressed,
    required this.label,
    this.outlineColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      fillColor: outlineColor ?? AppColors.whiteColor,
      constraints: BoxConstraints.tightFor(
        height: height ?? displayRemainingHeight(context) * 0.059,
        width: width ??
            displaySize(context).width.clamp(
                displayWidth(context) * 0.64, displayWidth(context) * 0.872),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(displayWidth(context) * 0.0106)),
        side: BorderSide(
          color: AppColors.blueColor,
          width: displayWidth(context) * 0.0053,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: displayRemainingHeight(context) * 0.0098,
        horizontal: displayWidth(context) * 0.0426,
      ),
      child: FittedBox(
        child: Text(
          label,
          style: AppTextStyle.longButtonStyle(labelColor,context:context),
        ),
      ),
    );
  }
}
