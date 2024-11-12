import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class TextFieldCustomDuringSeries extends StatelessWidget {
  const TextFieldCustomDuringSeries({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      width: 247,
      height: 23,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemesColor.themes[2][themeChoice],
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
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
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}