import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TextFieldNameFolder extends StatelessWidget {
  const TextFieldNameFolder({super.key});

  @override
  Widget build(BuildContext context) {
    // This method builds a widget tree that contains a styled TextField inside a Container with padding.
    return Container(
      padding: EdgeInsets.only(left: 41, right: 41), // Adds padding around the TextField
      child: TextField(
        // The TextField is styled with a specific text style and cursor color.
        style: ThemesTextStyles.textBigWhite,
        cursorColor: ThemesColor.white,
        textAlignVertical: TextAlignVertical.top, // Aligns the text vertically to the top
        decoration: InputDecoration(
          // The decoration provides visual styling for the TextField.
          labelStyle: ThemesTextStyles.textBigWhite, // Style for the label
          contentPadding: EdgeInsets.only(bottom: 5, left: 10), // Centers the cursor within the TextField
          border: OutlineInputBorder(
            // Outlines the border with rounded corners and no visible border side.
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: ThemesColor.blackColor3, // Sets the background color when filled
          focusColor: ThemesColor.green1, // Color when the field is focused
          constraints: BoxConstraints(
            // Constraints the size of the TextField
            maxWidth: 500,
            maxHeight: 43,
          ),
        ),
      ),
    );
  }
}
