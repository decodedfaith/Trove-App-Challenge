// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/view/create_account/create_account_view.dart';
import '../ui/view/home/home_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/onboarding/onboarding_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/splashscreen/splashscreen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String homeView = '/home-view';
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String createAccountView = '/create-account-view';
  static const String otpView = '/otp-view';
  static const all = <String>{
    splashScreenView,
    homeView,
    onboardingView,
    loginView,
    createAccountView,
    otpView,
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
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
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

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
