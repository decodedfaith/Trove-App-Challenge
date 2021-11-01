import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.router.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/utilities/api_handlers/app_api.dart';
import 'package:trove_app_challenge/utilities/constants/app_constants.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_view.form.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/storage_keys.dart';
import 'package:trove_app_challenge/utilities/enums.dart';

class CreateAccountViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final appApi = AppApi(coreBaseUrl);
  final storage = locator<SharedPreferenceLocalStorage>();


  String? get token => storage.getString(StorageKeys.currentSessionToken);

  bool isLoading = false;
  bool checkBoxValue = false;

  @override
  void setFormStatus() {}

  void loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToOtpView() => navigation.navigateTo(Routes.otpView);
  void navigateToSignIn() => navigation.navigateTo(Routes.loginView);
  // void navigateToHome() => navigator.navigateTo(Routes.navBarView);


  createUser() async {
    if (checkBoxValue == true) {
      loading(true);

      final signUpData = {
        'first_name': firstNameValue,
        'last_name': lastNameValue,
        'display_name': displayNameValue,
        'email': emailValue,
        'password': passwordValue,
        'phone': phoneNumberValue,
      };

      final response =
          await appApi.post(signUpEndpoint, body: signUpData, token: token);
      loading(false);
      if (response?.statusCode == 200) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: checkEmailForOTP,
        );
        navigateToOtpView();
      }
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: acceptTnC,
      );
    }
  }

}