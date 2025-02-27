
import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/menu/widget/widget_photo_user.dart';

class HeaderMenu extends StatelessWidget {
  final String name;
  final String firstName;
  const HeaderMenu({super.key, required this.name, required this.firstName});

  @override
  Widget build(BuildContext context) {
    int themesChoice = 0;
    return Column(
      children: [
        SizedBox(
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
                    Text(firstName, style: ThemesTextStyles.themes[7][0],),
                    Text(name, style: ThemesTextStyles.themes[7][0])
                  ],
                )
              ],
            ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
          child: Divider(
            color: ThemesColor.themes[1][themesChoice],
          ),
        ),
      ],
    );
  }
}
