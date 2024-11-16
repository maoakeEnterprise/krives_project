import 'package:flutter/material.dart';

class ThemesColor {
  //Colors for Dark Theme
  //========================================================================
  static const Color blackColor1 = Color.fromRGBO(30, 34, 38, 1); //#1E2226
  static const Color blackColor2 = Color.fromRGBO(22, 23, 26, 1); //#16171A
  static const Color blackColor3 = Color.fromRGBO(38, 43, 48, 1); //#262B30
  static const Color grey1 = Color.fromRGBO(91, 98, 104, 1); //#5B6268
  static const Color green1 = Color.fromRGBO(29, 218, 99, 1); //#1DDA63
  static const Color red1 = Color.fromRGBO(163, 38, 38, 1); //#A32626

  static const Color black = Color.fromRGBO(0, 0, 0, 1); //#000000
  static const Color white = Color.fromRGBO(255, 255, 255, 1); //#FFFFFF

  static const LinearGradient linearGradientCustom = LinearGradient(
      colors: [ThemesColor.blackColor1,ThemesColor.green1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2,1]
  );
  static const LinearGradient linearGradientCustom1 = LinearGradient(
      colors: [ThemesColor.blackColor1,ThemesColor.green1],
      begin: Alignment(0,0),
      end: Alignment(1,3.3),
      stops: [0.2,1]
  );

  static BoxShadow boxShadowCustom = BoxShadow(
    offset: Offset(1, 3),
    blurRadius: 5,
    color: Colors.black.withOpacity(0.7),
  );
  //========================================================================
  //Colors for white Theme
  //========================================================================

  //========================================================================
  //Stock themes
  //========================================================================
static var themes = [
  [blackColor1],//0
  [blackColor2],//1
  [blackColor3],//2
  [grey1],//3
  [green1],//4
  [red1],//5
  [black],//6
  [white],//7
];

static var themesGradient = [
  [linearGradientCustom],//0
  [linearGradientCustom1],//1
];
  //========================================================================


}
