import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class CommentCenterWidget extends StatelessWidget {
  final String commentary;
  const CommentCenterWidget({super.key, required this.commentary});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            children: [
              SizedBox(width: 7,),
              Text("Nom utilisateur",style: ThemesTextStyles.themes[5][themeChoice],),
              SizedBox(width: 14,),
              Text("2 j",style: ThemesTextStyles.themes[4][themeChoice],),
            ]),
        SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(width: 7,),
            Flexible(
              child: Text(commentary,
                softWrap: true,
                maxLines: 400,
                overflow: TextOverflow.clip,
                style: ThemesTextStyles.themes[3][themeChoice],
              ),
            ),
          ],
        ),
        SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(width: 7,),
            Text(SourceLangage.baseLangage[26][langageChoice],style: ThemesTextStyles.themes[12][themeChoice],),
          ],
        ),
        SizedBox(height: 7,),
        Row(
            children: [
              Container(height: 1,
                width: 30,
                color: ThemesColor.themes[3][themeChoice],
              ),
              SizedBox(width: 7,),
              Text("Voir 5 autre réponses",style: ThemesTextStyles.themes[12][themeChoice],),
            ])
      ],
    );
  }
}
