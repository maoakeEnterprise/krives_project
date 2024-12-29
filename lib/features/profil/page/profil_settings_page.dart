import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';
import 'package:krives_project/features/profil/widget/widget_app_design.dart';
import 'package:krives_project/features/profil/widget/widget_data_normal.dart';
import 'package:krives_project/features/profil/widget/widget_settings_account.dart';
import 'package:krives_project/features/profil/widget/widget_terms.dart';

class ProfilSettingsPage extends StatelessWidget {
  const ProfilSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ListView(
        children: [
          Text(SourceLangage.titleProfileLangage[0][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          WidgetDataNormal(),
          Text(SourceLangage.titleProfileLangage[1][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          WidgetSettingsAccount(),
          Text(SourceLangage.titleProfileLangage[2][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          WidgetAppDesign(),
          Text(SourceLangage.titleProfileLangage[3][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          WidgetTerms()
        ],
      ),
    );
  }
}
