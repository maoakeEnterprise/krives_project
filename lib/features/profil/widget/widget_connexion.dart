import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetConnexion extends StatelessWidget {
  const WidgetConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            onTap: (){
              ButtonActionServices.signOut(context);
            },
            title: Text(
              SourceLangage.titleProfileLangage[12][langageChoice],
              style: ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.logout_rounded),
            iconColor: ThemesColor.themes[5][themeChoice],
          ),
          ListTile(
            onTap: () {
              ButtonActionServices.popUpDeleteAccount(context);
            },
            title: Text(
              SourceLangage.titleProfileLangage[13][langageChoice],
              style: ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.delete_forever),
            iconColor: ThemesColor.themes[5][themeChoice],
          )
        ],
      ),
    );
  }


}
