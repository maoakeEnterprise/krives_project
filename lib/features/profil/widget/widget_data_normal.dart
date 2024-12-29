import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetDataNormal extends StatelessWidget {
  const WidgetDataNormal({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[4][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.person_sharp),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[5][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.sports_handball),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
        ],
      ),
    );
  }
}
