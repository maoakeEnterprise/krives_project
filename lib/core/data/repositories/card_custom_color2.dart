import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class CardCustomColor2 extends StatelessWidget{
  final Widget child;
  final double? width;
  final double? height;
  const CardCustomColor2({super.key, required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ThemesColor.blackColor1,
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
            gradient: LinearGradient(
                colors: [ThemesColor.blackColor1,ThemesColor.green1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.8,1]
            ),
            color: ThemesColor.blackColor1.withOpacity(0.1)
        ),
        child: child,
      ),
    );
  }
}