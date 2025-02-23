import 'package:flutter/material.dart';
import 'dart:math';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TextFieldTheme1 extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  const TextFieldTheme1({
    super.key,
    this.obscureText=false,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context){
    int chooseLangage = 0;
    int randomIntForTrolling = Random().nextInt(SourceLangage.trollLangage.length);

    return Container(
      padding: EdgeInsets.fromLTRB(41, 0, 41, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: Colors.black.withValues(alpha: 0.3),


            )
          ]
        ),
        child: TextField(
          obscureText: obscureText,
          obscuringCharacter: '•',
          controller: controller,
          style: ThemesTextStyles.textBigWhite,
          cursorColor: ThemesColor.white,
          decoration: InputDecoration(
            //suffixIcon: const Icon(Icons.clear_rounded),
            //suffixIconColor: Colors.white,
            labelText: labelText,
            labelStyle: ThemesTextStyles.textBigWhite,
            hintText: SourceLangage.trollLangage[randomIntForTrolling][chooseLangage],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: ThemesColor.blackColor3,
            focusColor: ThemesColor.green1,
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: 43
            )
          ),
        ),
      ),
    );
  }

}