import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove_app_challenge/ui/view/edit_profile/edit_profile_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'firstName'),
    FormTextField(name: 'lastName'),
    FormTextField(name: 'displayName'),
    FormTextField(name: 'phoneNumber'),
    FormTextField(name: 'dob'),
    FormTextField(name: 'address1'),
    FormTextField(name: 'address2'),
    FormTextField(name: 'state'),
    FormTextField(name: 'city'),
    FormTextField(name: 'zipCode'),
  ],
)
class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            editProfileButton,
            style: AppTextStyle.darkGreyBoldSize20(context),
          ),
          leading: InkWell(
            onTap: () => model.close(),
            child: const Icon(
              Icons.close_rounded,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                model.onSave();
              },
              child: model.isSaving
                  ? SizedBox(
                      height: displayHeight(context) * 0.0246,
                      width: displayWidth(context) * 0.0533,
                      child: const CircularProgressIndicator(
                          color: AppColors.blueColor),
                    )
                  : Text(
                      save,
                      style: AppTextStyle.greenNormalSize16(context),
                    ),
            )
          ],
        ),
        body: Padding(
          padding: UIHelper.bodyPadding(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.14,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      model.imageFile == null
                          ? Container(
                              width: displayHeight(context) * 0.14,
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(trovelogo),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      displayWidth(context) * 0.0266),
                                ),
                                color: AppColors.greyishColor,
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    size: displayWidth(context) * 0.06,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: displayHeight(context) * 0.14,
                              height: double.maxFinite,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      model.imageFile!,
                                      fit: BoxFit.cover,
                                      width: displayHeight(context) * 0.14,
                                      height: double.maxFinite,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: displayWidth(context) * 0.06,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const Spacer(),
                      SizedBox(
                        width: displayWidth(context) * 0.55,
                        child: TextFormField(
                          onChanged: (value) => model.onChanged(),
                          decoration: const InputDecoration(
                            labelText: firstName,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: lastName,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: address1,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: address2,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(),
                ),
                const TextField(
                  obscureText: true,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: dob,
                    hintText: dob,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: dob,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
