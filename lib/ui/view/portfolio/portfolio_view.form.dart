// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String StockSearchValueKey = 'stockSearch';

mixin $PortfolioView on StatelessWidget {
  final TextEditingController stockSearchController = TextEditingController();
  final FocusNode stockSearchFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    stockSearchController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            StockSearchValueKey: stockSearchController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    stockSearchController.dispose();
    stockSearchFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get stockSearchValue => this.formValueMap[StockSearchValueKey];

  bool get hasStockSearch => this.formValueMap.containsKey(StockSearchValueKey);
}

extension Methods on FormViewModel {}
