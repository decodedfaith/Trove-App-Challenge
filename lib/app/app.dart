import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/services/app_services/authentication_services.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_view.dart';
import 'package:trove_app_challenge/ui/view/home/home_view.dart';
import 'package:trove_app_challenge/ui/view/login/login_view.dart';
import 'package:trove_app_challenge/ui/view/onboarding/onboarding_view.dart';
import 'package:trove_app_challenge/ui/view/otp/otp_view.dart';
import 'package:trove_app_challenge/ui/view/splashscreen/splashscreen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: OtpView),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: AuthenticationService),

    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
