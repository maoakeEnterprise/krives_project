import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class CounterDotWidgetPlaytimeWorkout extends StatelessWidget {
  final bool isDone;
  const CounterDotWidgetPlaytimeWorkout({
    this.isDone = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemesColor.themes[4][themeChoice].withValues(alpha: isDone ? 1 : 0.5)
      ),
    );
  }
}
