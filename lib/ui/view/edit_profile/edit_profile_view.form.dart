// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';
const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String DisplayNameValueKey = 'displayName';
const String PhoneNumberValueKey = 'phoneNumber';
const String DobValueKey = 'dob';
const String Address1ValueKey = 'address1';
const String Address2ValueKey = 'address2';
const String StateValueKey = 'state';
const String CityValueKey = 'city';
const String ZipCodeValueKey = 'zipCode';

mixin $EditProfileView on StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode displayNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode address1FocusNode = FocusNode();
  final FocusNode address2FocusNode = FocusNode();
  final FocusNode stateFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode zipCodeFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    displayNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    dobController.addListener(() => _updateFormData(model));
    address1Controller.addListener(() => _updateFormData(model));
    address2Controller.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    zipCodeController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            EmailValueKey: emailController.text,
            FirstNameValueKey: firstNameController.text,
            LastNameValueKey: lastNameController.text,
            DisplayNameValueKey: displayNameController.text,
            PhoneNumberValueKey: phoneNumberController.text,
            DobValueKey: dobController.text,
            Address1ValueKey: address1Controller.text,
            Address2ValueKey: address2Controller.text,
            StateValueKey: stateController.text,
            CityValueKey: cityController.text,
            ZipCodeValueKey: zipCodeController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    emailController.dispose();
    emailFocusNode.dispose();
    firstNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    displayNameController.dispose();
    displayNameFocusNode.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    dobController.dispose();
    dobFocusNode.dispose();
    address1Controller.dispose();
    address1FocusNode.dispose();
    address2Controller.dispose();
    address2FocusNode.dispose();
    stateController.dispose();
    stateFocusNode.dispose();
    cityController.dispose();
    cityFocusNode.dispose();
    zipCodeController.dispose();
    zipCodeFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get emailValue => this.formValueMap[EmailValueKey];
  String? get firstNameValue => this.formValueMap[FirstNameValueKey];
  String? get lastNameValue => this.formValueMap[LastNameValueKey];
  String? get displayNameValue => this.formValueMap[DisplayNameValueKey];
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];
  String? get dobValue => this.formValueMap[DobValueKey];
  String? get address1Value => this.formValueMap[Address1ValueKey];
  String? get address2Value => this.formValueMap[Address2ValueKey];
  String? get stateValue => this.formValueMap[StateValueKey];
  String? get cityValue => this.formValueMap[CityValueKey];
  String? get zipCodeValue => this.formValueMap[ZipCodeValueKey];

  bool get hasEmail => this.formValueMap.containsKey(EmailValueKey);
  bool get hasFirstName => this.formValueMap.containsKey(FirstNameValueKey);
  bool get hasLastName => this.formValueMap.containsKey(LastNameValueKey);
  bool get hasDisplayName => this.formValueMap.containsKey(DisplayNameValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
  bool get hasDob => this.formValueMap.containsKey(DobValueKey);
  bool get hasAddress1 => this.formValueMap.containsKey(Address1ValueKey);
  bool get hasAddress2 => this.formValueMap.containsKey(Address2ValueKey);
  bool get hasState => this.formValueMap.containsKey(StateValueKey);
  bool get hasCity => this.formValueMap.containsKey(CityValueKey);
  bool get hasZipCode => this.formValueMap.containsKey(ZipCodeValueKey);
}

extension Methods on FormViewModel {}
