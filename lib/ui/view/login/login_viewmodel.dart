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
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();
  final _connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _authenticationService = locator<AuthenticationService>();

  final log = getLogger('LogInViewModel');

  bool isLoading = false;

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

  Future logInUser() async {
    var connected = await _connectivityService.checkConnection();
    if (!connected) {
      _snackbarService.showCustomSnackBar(
        message: noInternet,
        variant: SnackbarType.failure,
        duration: const Duration(milliseconds: 1500),
      );
      return;
    }
    loading(true);

    if (emailValue == null || passwordValue == null) {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.failure,
        message: fillAllFields,
      );
      return;
    }

    var result = await _authenticationService.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );

    loading(false);

    if (result is bool) {
      if (result) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: loggedIn,
        );
        navigateToPortfolio();
      } else {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: loginFailure,
        );
      }
    } else {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: result,
      );
    }
  }

  @override
  void setFormStatus() {}
}
