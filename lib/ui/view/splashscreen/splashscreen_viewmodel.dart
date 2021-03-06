import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/app/app.router.dart';

//BUSINESS LOGIC AND VIEW STATE
class SplashScreenViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  init() {
    Timer(const Duration(seconds: 6), () {
      navigation.clearStackAndShow(Routes.onboardingView);
    });
  }
}
