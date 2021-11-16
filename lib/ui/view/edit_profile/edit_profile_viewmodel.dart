import 'dart:io';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove_app_challenge/app/app.locator.dart';

class EditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  File? imageFile;
  bool isSaving = false;

  void onChanged() {}

  void close() => _navigationService.back();

  void onSave() {}
}
