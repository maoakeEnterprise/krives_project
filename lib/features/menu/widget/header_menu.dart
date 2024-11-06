import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';
import 'package:krives_project/features/menu/widget/widget_photo_user.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int choiceThemes = 0;

    return Container(
      height: 140,
      child: Row(
        children: [
          SizedBox(width: 31,),
          WidgetPhotoUser(),
          SizedBox(width: 19,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26,),
              Text("Maoake", style: ThemesTextStyles.themes[7][0],),
              Text("Teriierooiterai", style: ThemesTextStyles.themes[7][0])
            ],
          )
        ],
      )
    );
  }
}