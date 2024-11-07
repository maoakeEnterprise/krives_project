import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetSettingsAccount extends StatelessWidget {
  const WidgetSettingsAccount({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[6][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.security_update_good),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[7][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.data_object),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[8][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.keyboard_alt_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
        ],
      ),
    );
  }
}
