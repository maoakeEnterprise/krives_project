import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class CommentLikeWidget extends StatelessWidget {
  const CommentLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Column(
        children: [
          SizedBox(height: 10,),
          Icon(Icons.favorite_border,
            color: ThemesColor.themes[3][themeChoice],
            size: 18,
          ),
          Text("2",style: ThemesTextStyles.themes[12][themeChoice],),
        ]);
  }
}
