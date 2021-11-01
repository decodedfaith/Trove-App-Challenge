import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove_app_challenge/ui/shared/widgets/custome_textfield.dart';
import 'package:trove_app_challenge/ui/shared/widgets/long_button.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_view.form.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'firstName'),
    FormTextField(name: 'lastName'),
    FormTextField(name: 'displayName'),
    FormTextField(name: 'password'),
    FormTextField(name: 'confirmPassword'),
    FormTextField(name: 'phoneNumber'),
  ],
)
class CreateAccountView extends StatelessWidget with $CreateAccountView{
 CreateAccountView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CreateAccountViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(displayWidth(context)*0.0426),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace55(context),
                      Center(
                        child: Image.asset(
                          trovelogo,
                          height: displayHeight(context)*0.0615,
                          width: displayWidth(context)*0.1333,
                        ),
                      ),
                      UIHelper.verticalSpace24(context),
                      Center(
                        child: Text(
                          createAccount,
                          style: AppTextStyle.darkGreyBoldSize20(context),
                        ),
                      ),
                      UIHelper.verticalSpace4(context),
                      Center(
                        child: Text(
                          pleaseFillUp,
                          style: AppTextStyle.lightGreyNormalSize14(context),
                        ),
                      ),
                      UIHelper.customVerticalSpace(displayHeight(context)*0.0591),
                      Text(
                        firstName,
                        style: AppTextStyle.darkGreyBoldSize16(context),
                      ),
                      UIHelper.customVerticalSpace(displayHeight(context)*0.0123),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: firstNameController,
                        hintText: firstNameHintText,
                      ),
                      UIHelper.verticalSpace24(context),
                      Text(
                        lastName,
                        style: AppTextStyle.darkGreyBoldSize16(context),
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: lastNameController,
                        hintText: lastNameHintText,
                      ),
                      UIHelper.customVerticalSpace(displayHeight(context)*0.0246),
                      Text(
                        emailAddress,
                        style:AppTextStyle.darkGreyBoldSize16(context),
                      ),
                      UIHelper.customVerticalSpace(displayHeight(context)*0.0184),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: emailController,
                        hintText: emailHintText,
                      ),
                      UIHelper.verticalSpace24(context),
                      Text(
                        password,
                        style: AppTextStyle.darkGreyBoldSize16(context),
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: true,
                        controller: passwordController,
                        hintText: passwordHintText,
                      ),
                      UIHelper.verticalSpace24(context),
                      Text(
                        confirmPassword,
                        style: AppTextStyle.darkGreyBoldSize16(context),
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: true,
                        controller: confirmPasswordController,
                        hintText: confirmPasswordHinText,
                      ),
                      UIHelper.verticalSpace24(context),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 30,
                          //   // child: Checkbox(
                          //   //   // value: model.checkBoxValue,
                          //   //   value: (){},
                          //   //   onChanged: (){},
                          //   //   // onChanged: (newValue) =>
                          //   //   //     model.updateValue(newValue),
                          //   //   fillColor: MaterialStateProperty.all(
                          //   //       AppColors.zuriPrimaryColor),
                          //   // ),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tnC1,
                                style: AppTextStyle.lightGreyNormalSize12(context),
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Text(
                                  tnC2,
                                  style: AppTextStyle.termAndConditionStyle(context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      UIHelper.verticalSpace55(context),
                      LongButton(
                        onPressed: (){},
                        label:createAccount,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            alreadyHaveAcct,
                            style: AppTextStyle.darkGreyNormalSize14(context),
                          ),
                          TextButton(
                            child: Text(
                              signIn,
                              style: AppTextStyle.blueNormalSize14(context),
                            ),
                            onPressed: (){},
                            // onPressed: () => model.navigateToSignIn(),
                          )
                        ],
                      ),
                      UIHelper.verticalSpace55(context),
                    ],
                  ),
                ),
              ),
            ),
     ),
     viewModelBuilder: () => CreateAccountViewModel(),
   );
 }
}