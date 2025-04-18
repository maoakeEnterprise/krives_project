import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/services/profile_function_services.dart';

class ButtonPopUp extends StatelessWidget {
  final bool isConfirmButton;
  final TextEditingController? controller;
  const ButtonPopUp({
    super.key,
    this.controller,
    this.isConfirmButton = false,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;

    return GestureDetector(
      onTap: ProfileFunctionServices.isTheFunctionConfirmButtonOrNot(isConfirmButton, context),
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemesColor.themes[isConfirmButton ?4 : 1][themeChoice],
        ),
        child: Center(
            child: Text(SourceLangage.baseLangage[isConfirmButton ? 23 : 24][langageChoice],
              style: ThemesTextStyles.themes[isConfirmButton ? 9 : 8][themeChoice],
            ),),
      ),
    );
  }

}
