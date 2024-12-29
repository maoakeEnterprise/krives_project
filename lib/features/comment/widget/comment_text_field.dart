import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/comment/widget/comment_photo_user_widget.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Row(
      children: [
        SizedBox(width: 12,),
        CommentPhotoUserWidget(),
        SizedBox(width: 12,),
        Expanded(
          child: TextField(
            style: ThemesTextStyles.themes[7][themeChoice],
            cursorColor: ThemesColor.themes[7][themeChoice],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: SourceLangage.baseLangage[27][langageChoice],
              hintStyle: ThemesTextStyles.themes[4][themeChoice],
            ),
          ),
        ),
      ],
    );
  }
}
