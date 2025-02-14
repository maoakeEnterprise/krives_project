
import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/menu/widget/widget_photo_user.dart';

class HeaderMenu extends StatelessWidget {
  final String name;
  final String firstName;
  const HeaderMenu({super.key, required this.name, required this.firstName});

  @override
  Widget build(BuildContext context) {
    //int choiceThemes = 0;
    return SizedBox(
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
        ));
  }
}
