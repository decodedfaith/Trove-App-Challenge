import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.logger.dart';
import 'package:trove_app_challenge/app/app.router.dart';
import 'package:trove_app_challenge/services/app_services/authentication_services.dart';
import 'package:trove_app_challenge/services/app_services/connectivity_service.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/enums.dart';
import 'package:trove_app_challenge/ui/view/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _authenticationService = locator<AuthenticationService>();

  final log = getLogger('LogInViewModel');
  bool isLoading = false;

  //local function calls
  _showCustomSnackbar(message, time, {variant}) {
    _snackbarService.showCustomSnackBar(
      duration: time,
      variant: variant ?? SnackbarType.failure,
      message: message,
    );
  }

  _loginWithEmailAndPassword() async {
    return await _authenticationService.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  _setIsLoadingWhileLoggingIn() {
    loading(true);
    var result = _loginWithEmailAndPassword();
    loading(false);
    return result;
  }

  _isEmailOrPasswordNull() {
    if (emailValue == null || passwordValue == null) {
      loading(false);
      _showCustomSnackbar(
        fillAllFields,
        const Duration(milliseconds: 1500),
      );
      return;
    }
  }

  _checkIfConnectedToTheInterent() async {
    var connected = await _connectivityService.checkConnection();
    if (!connected) {
      _showCustomSnackbar(
        noInternet,
        const Duration(milliseconds: 1500),
      );
      return;
    }
  }

  _showLoginSnackbar(result) {
    if (result) {
      _showCustomSnackbar(
        loggedIn,
        const Duration(seconds: 3),
        variant: SnackbarType.success,
      );
      navigateToPortfolio();
    } else {
      _showCustomSnackbar(
        loginFailure,
        const Duration(seconds: 3),
      );
    }
  }

  _isLoginSuccessful(result) {
    if (result is bool) {
      _showLoginSnackbar(result);
    } else {
      _showCustomSnackbar(
        result,
        const Duration(seconds: 3),
      );
    }
  }

  //Global function calls
  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToHomeScreen() {
    _navigationService.navigateTo(Routes.homeView);
  }

  void navigateToPortfolio() {
    _navigationService.navigateTo(Routes.portfolioView);
  }

  void navigateToCreateAccountScreen() {
    _navigationService.replaceWith(Routes.createAccountView);
  }

  Future logInUserProcedure() async {
    _isEmailOrPasswordNull();
    _checkIfConnectedToTheInterent();
    var result = await _setIsLoadingWhileLoggingIn();
    _isLoginSuccessful(result);
  }

  @override
  void setFormStatus() {}
}
