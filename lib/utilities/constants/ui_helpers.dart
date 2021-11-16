import 'package:flutter/material.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';

/// Contains useful functions to reduce boilerplate and duplicate code
class UIHelper {

// vertical space in pixel
  static double _verticalSpace4(context){
    return displayHeight(context)*0.0049;
  }
  static double _verticalSpace6(context){
    return displayHeight(context)*0.0073;
  }
  static double _verticalSpace8(context){
    return displayHeight(context)*0.0098;
  }
  static double _verticalSpace10(context){
    return displayHeight(context)*0.0123;
  }
  static double _verticalSpace16(context){
    return displayHeight(context)*0.0197;
  }
  static double _verticalSpace24(context){
    return displayHeight(context)*0.0295;
  }
  static double _verticalSpace32(context){
    return displayHeight(context)*0.0394;
  }
  static double _verticalSpace40(context){
    return displayHeight(context)*0.0492;
  }
  static double _verticalSpace49(context){
    return displayHeight(context)*0.0603;
  }
  static double _verticalSpace55(context){
    return displayHeight(context)*0.0677;
  }
//
  

//in use
  static Widget verticalSpace4(context){
    return SizedBox(height: _verticalSpace4(context));
  }

  static Widget verticalSpace6(context){
    return SizedBox(height: _verticalSpace6(context));
  }

  static Widget verticalSpace8(context){
    return SizedBox(height: _verticalSpace8(context));
  }

  static Widget verticalSpace10(context){
    return SizedBox(height: _verticalSpace10(context));
  }

  static Widget verticalSpace16(context){
    return SizedBox(height: _verticalSpace16(context));
  }

  static Widget verticalSpace24 (context) {
    return SizedBox(height: _verticalSpace24(context));
  }

  static Widget verticalSpace32 (context) {
    return SizedBox(height: _verticalSpace32(context));
  }

  static Widget verticalSpace40 (context) {
    return SizedBox(height: _verticalSpace40(context));
  }

  static Widget verticalSpace49 (context) {
    return SizedBox(height: _verticalSpace49(context));
  }
  
  static Widget verticalSpace55(context){
    return SizedBox(height: _verticalSpace55(context));
  }

  static Widget customVerticalSpace(double value) => SizedBox(height: value);

  static Widget customHorizontalSpace(double value) => SizedBox(width: value);
//

  static EdgeInsets bodyPadding (context){
     return EdgeInsets.fromLTRB(
                displayWidth(context) * 0.0526,
                displayHeight(context) * 0.0246,
                displayWidth(context) * 0.0526,
                0,
              );
  }
  
}

// double screenAwareSize(double value, BuildContext context,
//     {bool width = false}) {
//   if (width) {
//     return MediaQuery.of(context).size.width * (value / 375);
//   } else {
//     return MediaQuery.of(context).size.height * (value / 812);
//   }
// }
