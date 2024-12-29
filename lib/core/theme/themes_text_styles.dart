import 'package:flutter/material.dart';
import 'themes_color.dart';

class ThemesTextStyles {
  //Text style dark Theme
  //========================================================================
  static const TextStyle textDescription1 = TextStyle(fontSize: 10, fontFamily: "Arial", color: ThemesColor.grey1);
  static const TextStyle textLinkAndDescription = TextStyle(fontSize: 10, fontFamily: "Arial", color: ThemesColor.green1);

  static const TextStyle textNormalGreen = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.green1);
  static const TextStyle textNormalWhite = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.white);
  static const TextStyle textNormalGrey = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.grey1);
  static const TextStyle textBoldWhite = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.white, fontWeight: FontWeight.bold);
  static const TextStyle textBoldGreen = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.green1, fontWeight: FontWeight.bold);

  static const TextStyle textBigWhite = TextStyle(fontSize: 18, fontFamily: "Arial", color: ThemesColor.white, fontWeight: FontWeight.normal);
  static const TextStyle textBigBoldWhite = TextStyle(fontSize: 18, fontFamily: "Arial", color: ThemesColor.white, fontWeight: FontWeight.bold);
  static const TextStyle textBigBoldBlack = TextStyle(fontSize: 18, fontFamily: "Arial", color: ThemesColor.black, fontWeight: FontWeight.bold);

  static const TextStyle textTitleMenuWhite = TextStyle(fontSize: 20, fontFamily: "Arial", color: ThemesColor.white);
  static const TextStyle textTitleTimerWidget = TextStyle(fontSize: 50, fontFamily: "Arial", color: ThemesColor.white, fontWeight: FontWeight.bold);
  static const TextStyle textBoldGrey = TextStyle(fontSize: 12, fontFamily: "Arial", color: ThemesColor.grey1, fontWeight: FontWeight.bold);
  //========================================================================
  //Text style white Theme
  //========================================================================

  //========================================================================
  //Stock themes
  //========================================================================
  static var themes = [
    [textDescription1],//0
    [textLinkAndDescription],//1
    [textNormalGreen],//2
    [textNormalWhite],//3
    [textNormalGrey],//4
    [textBoldWhite],//5
    [textBoldGreen],//6
    [textBigWhite],//7
    [textBigBoldWhite],//8
    [textBigBoldBlack],//9
    [textTitleMenuWhite],//10
    [textTitleTimerWidget],//11
    [textBoldGrey],//12
  ];

}
