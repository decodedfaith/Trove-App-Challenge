// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/app_services/authentication_services.dart';
import '../services/app_services/connectivity_service.dart';
import '../services/app_services/firestore_service.dart';
import '../services/app_services/local_storage_services.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FireService());
  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();
  locator.registerSingleton(sharedPreferenceLocalStorage);

  final connectivityService = await ConnectivityService.getInstance();
  locator.registerSingleton(connectivityService);
}
