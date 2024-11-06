import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ThemesColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemesColor.blackColor2,
      surfaceTintColor: ThemesColor.blackColor2,
      elevation: 5,
      shadowColor: ThemesColor.black,
      iconTheme: IconThemeData(
        color: ThemesColor.white
      )
    ),
  );
}