import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class CommentLikeWidget extends StatelessWidget {
  final Commentary commentary;
  const CommentLikeWidget({super.key, required this.commentary});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Column(
        children: [
          SizedBox(height: 10,),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite_border,
              color: ThemesColor.themes[3][themeChoice],
              size: 18,
            ),
          ),
          Text(commentary.getLengthLike(),style: ThemesTextStyles.themes[12][themeChoice],),
        ]);
  }
}
