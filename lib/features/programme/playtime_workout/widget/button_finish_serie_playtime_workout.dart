import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class ButtonFinishSeriePlaytimeWorkout extends StatelessWidget {
  const ButtonFinishSeriePlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: ThemesColor.themes[4][themeChoice],
              shape: BoxShape.circle
            ),
            child: Icon(Icons.check,color: ThemesColor.themes[6][themeChoice],),
          ),
        ],
      ),
    );
  }
}
