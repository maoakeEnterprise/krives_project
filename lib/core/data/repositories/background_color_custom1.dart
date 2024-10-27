import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';

class BackgroundColorCustom1 extends StatelessWidget {
  final Widget child;
  const BackgroundColorCustom1({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      color: ThemesColor.blackColor1,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.9, -0.8),
            end: Alignment.bottomRight,
            colors: [ThemesColor.blackColor1, ThemesColor.green1],
            stops: [0.1, 1],
          ),
          color: ThemesColor.blackColor1.withOpacity(0.15),
        ),
        child: child,
      ),
    );
  }
}
