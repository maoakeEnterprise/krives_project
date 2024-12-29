import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_card_exo_before_playtime_workout.dart';

class MiniWidgetCardExerciceBPW extends StatelessWidget {
  const MiniWidgetCardExerciceBPW({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return SizedBox(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MiniCardExoBeforePlaytimeWorkout(width: 30, height: 30,marginRight: 12,),
              MiniCardExoBeforePlaytimeWorkout(width: 30, height: 30),
            ],
          ),
          Text("Exo name",style: ThemesTextStyles.themes[5][themeChoice],)
        ],
      ),
    );
  }
}
