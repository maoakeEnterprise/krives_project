import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/widget/text_field_custom_during_series.dart';

class CardDuringSerieCustom extends StatelessWidget {
  const CardDuringSerieCustom({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      decoration: BoxDecoration(
        color: ThemesColor.themes[0][themeChoice],
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Text("Serie 1",style: ThemesTextStyles.themes[6][themeChoice],),
          SizedBox(height: 9,),
          Row(
            children: [
              SizedBox(width: 20 ,),
              Text("Charge : ",style: ThemesTextStyles.themes[3][themeChoice],),
              TextFieldCustomDuringSeries(),
          ]),
          SizedBox(height: 9,),
          Row(
            children: [
              SizedBox(width: 20 ,),
              Text("Repeat : ",style: ThemesTextStyles.themes[3][themeChoice],),
              TextFieldCustomDuringSeries(),
            ],
          )
        ]),
    );
  }
}
