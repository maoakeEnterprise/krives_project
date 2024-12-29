import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class ButtonPopUp extends StatelessWidget {
  final bool isConfirmButton;
  final String text;
  const ButtonPopUp({
    super.key,
    required this.text,
    this.isConfirmButton = false,
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    VoidCallback onTap = isConfirmButton ? (){confirmDelete(context);} : (){closePopUp(context);};
    Color color = isConfirmButton ? ThemesColor.themes[5][chooseThemes] : ThemesColor.themes[1][chooseThemes];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(text,style: ThemesTextStyles.themes[8][chooseThemes],),
        ),
      ),
    );
  }
}

void closePopUp(BuildContext context) {
  Navigator.of(context).pop();
}

void confirmDelete(BuildContext context) {
  Navigator.of(context).pop();
}
