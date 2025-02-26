import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/bloc/pop_delete_account_bloc.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/page/pop_up_delete_account.dart';
import 'package:krives_project/features/profil/widget/widget_app_design.dart';
import 'package:krives_project/features/profil/widget/widget_connexion.dart';
import 'package:krives_project/features/profil/widget/widget_data_normal.dart';
import 'package:krives_project/features/profil/widget/widget_settings_account.dart';
import 'package:krives_project/features/profil/widget/widget_terms.dart';

class ProfilSettingsPage extends StatelessWidget {
  const ProfilSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;

    return BlocListener<PopDeleteAccountBloc, PopDeleteAccountState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is PopUped){
      showDialog(
        context: context,
        builder: (context) {
          return PopUpDeleteAccount();
        },
      );
    }
  },
  child: Container(
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
          WidgetTerms(),
          //SizedBox(height: 20,),
          Text(SourceLangage.titleProfileLangage[11][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          WidgetConnexion(),
        ],
      ),
    ),
);
  }
}
