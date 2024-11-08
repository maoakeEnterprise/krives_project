import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class CardCustomColor1 extends StatelessWidget{
  final Widget child;
  final double? width;
  final double? height;
  const CardCustomColor1({super.key, required this.child, required this.width, required this.height});

    @override
  Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
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
                stops: [0.2,1]
            ),
            color: ThemesColor.blackColor1.withOpacity(0.07)
          ),
          child: child,
        ),
      );
    }
}