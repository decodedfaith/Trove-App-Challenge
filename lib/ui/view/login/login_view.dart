import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove_app_challenge/ui/shared/widgets/app_loader.dart';
import 'package:trove_app_challenge/ui/shared/widgets/custome_textfield.dart';
import 'package:trove_app_challenge/ui/shared/widgets/long_button.dart';
import 'package:trove_app_challenge/ui/view/login/login_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';
import 'package:trove_app_challenge/ui/view/login/login_view.form.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      //listenToFormUpdated automatically
      //syncs text from TextFields to the viewmodel
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const AppLoader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                displayWidth(context) * 0.0526,
                displayHeight(context) * 0.0246,
                displayWidth(context) * 0.0526,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UIHelper.verticalSpace55(context),
                  Container(
                    height: displayHeight(context) * 0.0615,
                    alignment: Alignment.center,
                    child: Image.asset(trovelogo),
                  ),
                  UIHelper.verticalSpace24(context),
                  Center(
                    child: Text(
                      signIn,
                      style: AppTextStyle.darkGreyBoldSize20(context),
                    ),
                  ),
                  UIHelper.verticalSpace8(context),
                  Text(
                    signInGreeting,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.lightGreyNormalSize14(context),
                  ),
                  UIHelper.customVerticalSpace(38.0),
                  Text(
                    emailAddress,
                    style: AppTextStyle.darkGreyBoldSize16(context),
                  ),
                  UIHelper.verticalSpace10(context),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: false,
                    hintText: emailHintText,
                    controller: emailController,
                  ),
                  UIHelper.verticalSpace16(context),
                  Text(
                    password,
                    style: AppTextStyle.darkGreyBoldSize16(context),
                  ),
                  UIHelper.verticalSpace10(context),
                  CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: true,
                    hintText: passwordHintText,
                    controller: passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        //Hides the keyboard for the failure
                        //snackbar to be visible
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        forgotPassword,
                        style: AppTextStyle.blueNormalSize14(context),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace32(context),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: displayWidth(context) * 0.00245,
                      child: LongButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          model.busy(true);
                          await model.logInUser();
                        },
                        label: signIn,
                        labelColor: AppColors.blueTextColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dontHaveAccount,
                        style: AppTextStyle.darkGreyNormalSize14(context),
                      ),
                      TextButton(
                        onPressed: () => model.navigateToCreateAccountScreen(),
                        child: Text(
                          create,
                          style: AppTextStyle.blueNormalSize14(context),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
