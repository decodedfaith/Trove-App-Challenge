import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove_app_challenge/ui/shared/widgets/app_loader.dart';
import 'package:trove_app_challenge/ui/view/otp/otp_viewmodel.dart';
import 'package:trove_app_challenge/ui/view/otp/otp_view.form.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'otp'),
  ],
)
class OtpView extends StatelessWidget with $OtpView{
  OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      //listenToFormUpdated automatically syncs text
      //from TextFields to the viewmodel
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => OtpViewModel(),
      staticChild: OtpViewModel.init(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const AppLoader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                displayWidth(context)*0.0533, 
                displayWidth(context)*0.0246, 
                displayWidth(context)*0.0533, 
                0
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UIHelper.verticalSpace6(context),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(trovelogo),
                    ),
                    UIHelper.verticalSpace24(context),
                    Center(
                      child: Text(
                        otp,
                        style: AppTextStyle.normalSize20(context),
                      ),
                    ),
                    UIHelper.verticalSpace6(context),
                    const Center(
                      child: Text(
                        enterOTP,
                      ),
                    ),
                    UIHelper.verticalSpace49(context),
                    Form(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: displayHeight(context)*0.0098,
                        ),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.bold,
                          ),
                          validator: (value) {},
                          length: 6,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            selectedColor: AppColors.blueColor,
                            selectedFillColor: AppColors.blueColor,
                            shape: PinCodeFieldShape.box,
                            activeColor: AppColors.blueColor,
                            disabledColor: Colors.grey,
                            inactiveColor: Colors.white,
                            inactiveFillColor: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(displayWidth(context)*0.0133),
                            fieldHeight: displayHeight(context)*0.0615,
                            fieldWidth: displayWidth(context)*0.1333,
                            activeFillColor: AppColors.blueColor,
                          ),
                          cursorColor: AppColors.blueColor,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: displayWidth(context)*0.0266,
                            )
                          ],
                          onCompleted: (value) {},
                          onTap: () {},
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace10(context),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: didntRecieveOTP,
                              style: AppTextStyle.darkGreyNormalSize12(context),
                            ),
                            TextSpan(
                              text: resend,
                              style: AppTextStyle.blueNormalSize16(context).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace40(context),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: displayWidth(context)*0026,
                        child: ElevatedButton(
                          onPressed: () => model.verifyOTP(context),
                          child: Text(
                            cont,
                            style: AppTextStyle.whiteBoldSize16(context).copyWith(fontStyle: FontStyle.normal)
                          ),
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.only(
                                  top: displayHeight(context)*0.0184, 
                                  bottom: displayHeight(context)*0.0184
                                ),
                            primary: AppColors.blueColor,
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace16(context),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          model.navigateLogin();
                        },
                        child: const Text(
                          backToLogin,
                          style: TextStyle(color: AppColors.blueColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
