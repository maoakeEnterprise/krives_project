import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TextFieldCustomSeries extends StatelessWidget {
  const TextFieldCustomSeries({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 13, 200, 13),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
      width: 208,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: ThemesColor.themes[2][themeChoice],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(1, 3),
            blurRadius: 5
          )
        ]
      ),
      constraints: BoxConstraints(
        maxWidth: 208
      ),
      child: TextField(
        maxLength: 24,
        cursorHeight: 14,
        style: ThemesTextStyles.themes[3][themeChoice],
        cursorColor: ThemesColor.themes[7][themeChoice],
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: ThemesColor.themes[2][themeChoice],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          labelText: SourceLangage.titleSeriesPage[4][langageChoice],
          labelStyle: ThemesTextStyles.themes[0][themeChoice],
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
