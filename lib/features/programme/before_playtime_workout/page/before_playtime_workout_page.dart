import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/menu_bar_before_playtime_workout.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/profile_before_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/widget_scroll_before_playtime_workout.dart';

class BeforePlaytimeWorkoutPage extends StatelessWidget {
  const BeforePlaytimeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileBeforePlaytimeWorkoutWidget(),
        MenuBarBeforePlaytimeWorkout(),
        SizedBox(height: 16,),
        WidgetScrollBeforePlaytimeWorkout(),
      ],
    );
  }
}
