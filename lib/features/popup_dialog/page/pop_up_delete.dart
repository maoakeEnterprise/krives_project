import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/popup_dialog/widget/button_pop_up.dart';

import '../../../core/theme/themes_text_styles.dart';

class PopUpDelete extends StatelessWidget {
  const PopUpDelete({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseLangage =  0;
    int chooseThemes = 0;
    return Dialog(
      child: Container(
        height: 118,
        constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: ThemesColor.themes[0][chooseThemes],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 24,),
            Text(SourceLangage.baseLangage[25][chooseLangage],style: ThemesTextStyles.themes[8][chooseThemes],),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPopUp(text: SourceLangage.baseLangage[24][chooseLangage],),
                SizedBox(width: 18,),
                ButtonPopUp(isConfirmButton: true, text: SourceLangage.baseLangage[23][chooseLangage],),
              ],
            )
          ],
        ),
      ),
    );

  }
}
