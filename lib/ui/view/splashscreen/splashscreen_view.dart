import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove_app_challenge/ui/view/splashscreen/splashscreen_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: displayWidth(context),
          height: displayHeight(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(splashScreen), fit: BoxFit.cover),
          ),
          child: Center(
            child: Text(
              trovelogo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: displayWidth(context) * 0.0906,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  wordSpacing: displayWidth(context) * 0.008,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
