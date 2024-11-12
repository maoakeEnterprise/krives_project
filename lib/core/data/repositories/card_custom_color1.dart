import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

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
    required this.child,
    this.width=0,
    this.height=0,
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
          boxShadow: [BoxShadow(
            offset: Offset(1,3),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.7)
          )]
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: ThemesColor.themesGradient[0][themeChoice],
            color: ThemesColor.themes[0][themeChoice].withOpacity(0.07)
          ),
          child: child,
        ),
      );
    }
}