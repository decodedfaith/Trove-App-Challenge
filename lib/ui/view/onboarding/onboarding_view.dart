import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove_app_challenge/ui/shared/widgets/long_button.dart';
import 'package:trove_app_challenge/ui/view/onboarding/onboarding_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(loginScreen), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LongButton(
                onPressed: model.navigateToCreateAccount,
                label: create,
                outlineColor: AppColors.blueColor,
                labelColor: AppColors.whiteColor,
              ),
              UIHelper.verticalSpace24(context),
              LongButton(
                onPressed: model.navigateToSignIn,
                label: login,
                outlineColor: AppColors.whiteColor,
                labelColor: AppColors.blueColor,
              ),
              UIHelper.verticalSpace55(context),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}
