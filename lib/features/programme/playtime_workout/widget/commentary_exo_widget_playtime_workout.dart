import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class CommentaryExoWidgetPlaytimeWorkout extends StatelessWidget {
  const CommentaryExoWidgetPlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(25, 13, 25, 0),
      width: 380,
      height: 276,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
      ),
    );
  }
}
