import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';

class CardCustomExercise extends StatelessWidget {
  const CardCustomExercise({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return CardCustomColor1(
        width: 380,
        height: 170,
        child: Row(
          children: [
            SizedBox(width: 22,),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 22,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 170,),
                    Icon(Icons.delete_outline,size: 20,color: ThemesColor.themes[7][0],),
                  ],
                ),
                Text("Push up", style: ThemesTextStyles.themes[5][0],),
                SizedBox(height: 10,),
                Text("Muscle : My cock", style: ThemesTextStyles.themes[3][0],),
                SizedBox(
                  width: 190,
                  child: Text(
                    "Il s'agirait de mettre les deux bras par terre hehe ",
                    style: ThemesTextStyles.themes[4][0],
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )

          ],
        ),
    );
  }
}
