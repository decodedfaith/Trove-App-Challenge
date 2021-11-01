import 'package:flutter/material.dart';

// figma design resolution = 375 * 812

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

double displayRemainingHeight(context) {
  return displayHeight(context) -
      MediaQuery.of(context).padding.top -
      kToolbarHeight-kBottomNavigationBarHeight;
}

// const double widthFactor = 0.266;
// const double heightFactor = 0.123;
