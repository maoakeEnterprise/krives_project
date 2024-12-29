import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/popup_dialog/widget/button_pop_up_timer.dart';

class PopUpTimer extends StatelessWidget {
  const PopUpTimer({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    int chooseLangage = 0;
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
            Text(SourceLangage.baseLangage[28][chooseLangage],style: ThemesTextStyles.themes[8][chooseThemes],),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPopUpTimer(),
                SizedBox(width: 18,),
                ButtonPopUpTimer(isConfirmButton: true,),
                ],
            )
          ],
        ),
      ),
    );
  }
}
