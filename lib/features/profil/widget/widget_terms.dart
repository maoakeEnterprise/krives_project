import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetTerms extends StatelessWidget {
  const WidgetTerms({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            title: Text(
              SourceLangage.titleProfileLangage[10][langageChoice],
              style:  ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: ThemesColor.themes[7][themeChoice],
          ),
        ],
      ),
    );
  }
}
