import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/core/data/repositories/custom_button1.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';
import 'package:krives_project/features/connexion/widget/cardview_logo_connection.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseLangage = 1;

    return Scaffold(
        body: BackgroundColorCustom1(
          child: Column(
              children: [
                CardViewLogoConnexion(),
                TextFieldTheme1(labelText: SourceLangage.baseLangage[0][chooseLangage],),// Pseudo
                TextFieldTheme1(labelText: SourceLangage.baseLangage[1][chooseLangage],),// Password
                CustomButton1(labelText: SourceLangage.baseLangage[8][chooseLangage]),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 500
                  ),
                  margin: EdgeInsets.fromLTRB(55, 4, 41, 0),
                  child: Row(
                    children: [
                      Text(SourceLangage.baseLangage[9][chooseLangage], style: ThemesTextStyles.textNormalGreen,),//Sign in ?
                      Text(SourceLangage.baseLangage[10][chooseLangage], style: ThemesTextStyles.textNormalWhite,)//Forget password ?
                    ],
                  ),
                )
              ]
          ),
        ),
    );
  }
}
