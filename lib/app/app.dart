import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/services/app_services/authentication_services.dart';
import 'package:trove_app_challenge/services/app_services/connectivity_service.dart';
import 'package:trove_app_challenge/services/app_services/firestore_service.dart';
import 'package:trove_app_challenge/services/app_services/local_storage_services.dart';
import 'package:trove_app_challenge/ui/view/create_account/create_account_view.dart';
import 'package:trove_app_challenge/ui/view/edit_profile/edit_profile_view.dart';
import 'package:trove_app_challenge/ui/view/home/home_view.dart';
import 'package:trove_app_challenge/ui/view/login/login_view.dart';
import 'package:trove_app_challenge/ui/view/onboarding/onboarding_view.dart';
import 'package:trove_app_challenge/ui/view/otp/otp_view.dart';
import 'package:trove_app_challenge/ui/view/portfolio/portfolio_view.dart';
import 'package:trove_app_challenge/ui/view/splashscreen/splashscreen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, ),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: PortfolioView),
    MaterialRoute(page: EditProfileView, initial: true),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: FireService),

    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),

    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
