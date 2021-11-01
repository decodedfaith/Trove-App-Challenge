import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/enums.dart';

class AppSnackBar {
  static void setupSnackbarUi() {
    final service = locator<SnackbarService>();

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.success,
      config: SnackbarConfig(
        backgroundColor: AppColors.blueColor,
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.failure,
      config: SnackbarConfig(
        backgroundColor: AppColors.redColor.withOpacity(0.6),
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }
}
