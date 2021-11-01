import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.router.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/utilities/api_handlers/app_api.dart';
import 'package:trove_app_challenge/utilities/constants/app_constants.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/storage_keys.dart';
import 'package:trove_app_challenge/ui/view/otp/otp_view.form.dart';
import 'package:trove_app_challenge/utilities/enums.dart';

class OtpViewModel extends FormViewModel {
  final _navigationService = NavigationService();
  static final _storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  final appApi = AppApi(coreBaseUrl);
  static String? _storedOTP;
  String? get token => _storage.getString(StorageKeys.currentSessionToken);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void setFormStatus() {
  }

  static init() {
    _storedOTP = _storage.getString(StorageKeys.otp);
  }

  void _loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  void navigateLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void verifyOTP(context) async {
    _loading(true);

    if ((otpValue!.length) > 5) {
      final verificationData = {
        'code': otpValue,
      };
      if (_storedOTP == otpValue) {
        final response = await appApi.post(verifyAcctEndpoint,
            body: verificationData, token: token);
        _loading(false);
        if (response?.statusCode == 200) {
          snackbar.showCustomSnackBar(
            duration: const Duration(seconds: 3),
            variant: SnackbarType.success,
            message: response?.data['message'],
          );
          _storage.setBool(StorageKeys.registeredNotverifiedOTP, false);
          navigateLogin();
        } else {
          snackbar.showCustomSnackBar(
            duration: const Duration(seconds: 3),
            variant: SnackbarType.failure,
            message: response?.data['message'] ?? errorOccurred,
          );
        }
      } else {
        _loading(false);
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: wrongOTP,
        );
      }
    }
  }

}