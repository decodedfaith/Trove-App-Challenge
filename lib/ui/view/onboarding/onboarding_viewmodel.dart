import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  void navigateToCreateAccount() =>
      navigation.navigateTo(Routes.createAccountView);
      
  void navigateToSignIn() {
    navigation.replaceWith(Routes.loginView);
  }
}
