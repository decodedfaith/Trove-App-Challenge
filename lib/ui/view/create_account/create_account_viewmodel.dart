import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.router.dart';
import 'package:trove_app_challenge/services/app_services/authentication_services.dart';
import 'package:trove_app_challenge/services/app_services/connectivity_service.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/utilities/api_handlers/app_api.dart';
import 'package:trove_app_challenge/utilities/constants/app_constants.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_view.form.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/enums.dart';

class CreateAccountViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final appApi = AppApi(coreBaseUrl);
  final storage = locator<SharedPreferenceLocalStorage>();
  final _authenticationService = locator<AuthenticationService>();
  final _connectivityService = locator<ConnectivityService>();


  
  @override
  void setFormStatus() {}

  bool isLoading = false;

  bool checkBoxValue = false;

  void loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  void navigateToOtpView() => navigation.navigateTo(Routes.otpView);

  void navigateToSignIn() => navigation.navigateTo(Routes.loginView);

  validateAndCreateUser() {
    _isThereInternetConnection();
    _isCheckedBoxChecked();
  }

  //local function calls limitd to within the folder
  _showCustomSnackbar(message, time) {
    snackbar.showCustomSnackBar(
      duration: time,
      variant: SnackbarType.failure,
      message: message,
    );
  }

  _checkIfFieldsAreNullOrEmpty() {
    if (emailValue == null ||
        passwordValue == null ||
        emailValue == '' ||
        passwordValue == '') {
      loading(false);
      _showCustomSnackbar(
        fillAllFields,
        const Duration(milliseconds: 1500),
      );
      return;
    }
  }

  _isSignUpSuccessful(result) {
    if (result) {
      _showCustomSnackbar(
        accountCreated,
        const Duration(seconds: 3),
      );
      navigateToSignIn();
    } else {
      _showCustomSnackbar(
        accountCreationFailure,
        const Duration(seconds: 3),
      );
    }
  }

  _signUpReturnsBool(result) {
    if (result is bool) {
      _isSignUpSuccessful(result);
    } else {
      _showCustomSnackbar(
        result,
        const Duration(seconds: 3),
      );
    }
  }

  _signUpWithEmailAndPassword() async {
    return await _authenticationService.signUpWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  _isCheckedBoxChecked() async {
    if (checkBoxValue == true) {
      loading(true);
      _checkIfFieldsAreNullOrEmpty();
      var result = _signUpWithEmailAndPassword();
      loading(false);
      _signUpReturnsBool(result);
    } else {
      _showCustomSnackbar(
        acceptTnC,
        const Duration(seconds: 3),
      );
    }
  }

  _isThereInternetConnection() async {
    var connected = await _connectivityService.checkConnection();
    if (!connected) {
      _showCustomSnackbar(
        noInternet,
        const Duration(milliseconds: 1500),
      );
      return;
    }
  }
}
