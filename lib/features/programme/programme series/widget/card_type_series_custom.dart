import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class CardTypeSeriesCustom extends StatelessWidget {
  final String text;
  const CardTypeSeriesCustom({
    super.key,
    this.text=""
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice =0;
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 12),
      height: 42,
      decoration: BoxDecoration(
        color: ThemesColor.themes[2][themeChoice],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SizedBox(width: 15,),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ThemesColor.themes[4][themeChoice],
            ),
          ),
          SizedBox(width: 15,),
          Text(text,style: ThemesTextStyles.themes[5][themeChoice],),
        ],
      ),
    );
  }
}
