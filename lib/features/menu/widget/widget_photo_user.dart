import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class WidgetPhotoUser extends StatelessWidget {
  const WidgetPhotoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: ThemesColor.green1,
        shape: BoxShape.circle,

      ),
    );
  }
}
