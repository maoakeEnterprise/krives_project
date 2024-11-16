import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/hub_communautaire/widget/grid_view_vertical_hub_commu.dart';

class CardWidgetScrollWidgetVerticalHubCommu extends StatelessWidget {
  const CardWidgetScrollWidgetVerticalHubCommu({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return CardCustomColor1(
      width: 320,
      height: 231,
      left: 55, right: 55, bottom: 12,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 15, 0, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Workout Name",style: ThemesTextStyles.themes[5][themeChoice],),
            GridViewVerticalHubCommu(),
            Row(
              children: [
                Spacer(),
                Icon(Icons.favorite_border,color: Colors.white,),
                SizedBox(width: 5,),
                Text("2300 likes",style: ThemesTextStyles.themes[5][themeChoice],),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
