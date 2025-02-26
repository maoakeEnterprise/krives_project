import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TextFieldDeleteAccount extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldDeleteAccount({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50,),
      padding: EdgeInsets.only(left: 10, right: 10,top: 13,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemesColor.themes[2][themeChoice],
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        obscuringCharacter: '•',
        style: ThemesTextStyles.themes[7][themeChoice],
        cursorColor: ThemesColor.themes[7][themeChoice],
        decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 30),
          hintText: "",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )
        ),
      ),
    );
  }
}
