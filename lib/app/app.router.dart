// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/view/create_account/create_account_view.dart';
import '../ui/view/edit_profile/edit_profile_view.dart';
import '../ui/view/home/home_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/onboarding/onboarding_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/portfolio/portfolio_view.dart';
import '../ui/view/splashscreen/splashscreen_view.dart';

class Routes {
  static const String splashScreenView = '/splash-screen-view';
  static const String homeView = '/home-view';
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String createAccountView = '/create-account-view';
  static const String otpView = '/otp-view';
  static const String portfolioView = '/portfolio-view';
  static const String editProfileView = '/';
  static const all = <String>{
    splashScreenView,
    homeView,
    onboardingView,
    loginView,
    createAccountView,
    otpView,
    portfolioView,
    editProfileView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.portfolioView, page: PortfolioView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    OtpView: (data) {
      var args = data.getArgs<OtpViewArguments>(
        orElse: () => OtpViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OtpView(key: args.key),
        settings: data,
      );
    },
    PortfolioView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PortfolioView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditProfileView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// OtpView arguments holder class
class OtpViewArguments {
  final Key? key;
  OtpViewArguments({this.key});
}
