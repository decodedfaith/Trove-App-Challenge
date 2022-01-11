import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove_app_challenge/ui/view/home/home_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: UIHelper.bodyPadding(context),
          child: const Center(
            child: Text("fsfsfsfsfsf"),
          ),
        ),
      ),
    );
  }
}
