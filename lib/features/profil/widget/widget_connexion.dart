import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/user_service.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/page/pop_up_delete_account.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetConnexion extends StatelessWidget {
  const WidgetConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    UserService userService = UserService();
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              await userService.signOut(context);
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
              showDialog(
                context: context,
                builder: (context) {
                  return PopUpDeleteAccount();
                },
              );
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
