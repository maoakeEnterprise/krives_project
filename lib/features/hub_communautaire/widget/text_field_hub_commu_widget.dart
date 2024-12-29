import 'dart:math';

import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TextFieldHubCommuWidget extends StatelessWidget {
  final String labelText;
  const TextFieldHubCommuWidget({
    super.key,
    this.labelText = "",
  });

  @override
  Widget build(BuildContext context) {
    int chooseLangage = 0;
    int randomIntForTrolling = Random().nextInt(SourceLangage.trollLangage.length);
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                )
              ]
          ),
          child: TextField(
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
                    maxHeight: 43,
                    maxWidth: 500,
                )
            ),
          ),
        ),
      ),
    );
  }
}
