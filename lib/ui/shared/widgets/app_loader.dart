import 'package:flutter/material.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';

class AppLoader extends StatefulWidget {
  final bool isTransparent;
  const AppLoader({Key? key, this.isTransparent = false}) : super(key: key);

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isTransparent
          ? Colors.transparent
          : AppColors.whiteColor,
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Padding(
              padding: EdgeInsets.all(displayWidth(context)*0.0213),
              child: Container(
                height: displayHeight(context)*0.0615,
                width: displayWidth(context)*0.1333,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(trovelogo),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
