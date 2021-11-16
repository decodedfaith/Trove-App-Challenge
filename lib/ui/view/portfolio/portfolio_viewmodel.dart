import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove_app_challenge/app/app.locator.dart';
import 'package:trove_app_challenge/models/detail_model.dart';
import 'package:trove_app_challenge/models/portfolio_model.dart';
import 'package:trove_app_challenge/services/app_services/firestore_service.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';

class PortfolioViewModel extends FormViewModel {
  final _fireService = locator<FireService>();
  TroveDataDetails? details;
  bool? checkPortfolio;
  int totalEquityValue = 0;
  List portfolioColors = [
    AppColors.green,
    AppColors.blueColor,
    AppColors.blackColor,
    Colors.orangeAccent,
    AppColors.lightGreen
  ];

  getDetails() async {
    await _fireService.getCategoriesCollectionFromFirebase().then((value) {
      details = _fireService.getCategories();
    });
    getEquityValue();
    notifyListeners();
  }

  getEquityValue() {
    for (Portfolio y in details!.portfolio) {
      totalEquityValue = totalEquityValue +
          int.parse(
            y.equityValue.toString(),
          );
    }
  }

  void check() {
    checkPortfolio = true;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
