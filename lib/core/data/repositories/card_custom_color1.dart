import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class CardCustomColor1 extends StatelessWidget{
  final Widget child;
  final double width;
  final double height;
  final double left;
  final double top;
  final double right;
  final double bottom;
  const CardCustomColor1({
    super.key,
    this.child = const SizedBox(),
    required this.width,
    required this.height,
    this.left=0,
    this.top=0,
    this.right=0,
    this.bottom=0,
  });

    @override
  Widget build(BuildContext context){
      int themeChoice = 0;
      return Container(
        margin: EdgeInsets.fromLTRB(left,top,right,bottom),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ThemesColor.themes[0][themeChoice],
          boxShadow: [ThemesColor.boxShadowCustom]
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: ThemesColor.themesGradient[0][themeChoice],
            color: ThemesColor.themes[0][themeChoice].withValues(alpha: 0.07)
          ),
          child: child,
        ),
      );
    }
}