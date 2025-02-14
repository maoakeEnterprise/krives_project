import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

import '../../../core/theme/themes_text_styles.dart';

class CustomButton1 extends StatelessWidget {
  final String? labelText;
  final Map<String, TextEditingController> textEditingController;

  const CustomButton1(
      {super.key, required this.labelText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Ink(
        child: Container(
          margin: EdgeInsets.fromLTRB(41, 0, 41, 0),
          height: 43,
          constraints: BoxConstraints(
              maxWidth: 500
          ),
          decoration: BoxDecoration(
            color: ThemesColor.green1,
            borderRadius: BorderRadius.circular(21.5),
          ),
          child: Center(
            child: Text(labelText!,
              style: ThemesTextStyles.textBigBoldBlack,
            ),
          ),
        ),
      ),
    );
  }
}