import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/popup_add_prog_folder/widget/button_pop_up_folder.dart';
import 'package:krives_project/features/popup_add_prog_folder/widget/text_field_name_folder.dart';

class PopUpAddPf extends StatelessWidget {
  const PopUpAddPf({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 250,
        constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: ThemesColor.themes[0][themeChoice],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 24,),
            Text(SourceLangage.titleProgramsUserLangageWithPopUp[5][langageChoice],
                style: ThemesTextStyles.themes[8][themeChoice]),
            SizedBox(height: 18,),
            TextFieldNameFolder(),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonPopUpFolder(isConfirmButton: true,),
                ButtonPopUpFolder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}