import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/widget/button_pop_up.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/widget/text_field_delete_account.dart';

class PopUpDeleteAccount extends StatelessWidget {
  const PopUpDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    TextEditingController passwordController = TextEditingController();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 220,
        constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: ThemesColor.themes[0][themeChoice],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(SourceLangage.baseLangage[1][langageChoice],
              style: ThemesTextStyles.themes[8][themeChoice],
            ),
            SizedBox(height: 20,),
            TextFieldDeleteAccount(controller: passwordController,),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonPopUp(isConfirmButton: true,controller: passwordController,),
                ButtonPopUp(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
