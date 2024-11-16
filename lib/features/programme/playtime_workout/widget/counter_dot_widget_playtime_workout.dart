import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class CounterDotWidgetPlaytimeWorkout extends StatelessWidget {
  const CounterDotWidgetPlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemesColor.themes[4][themeChoice]
      ),
    );
  }
}
