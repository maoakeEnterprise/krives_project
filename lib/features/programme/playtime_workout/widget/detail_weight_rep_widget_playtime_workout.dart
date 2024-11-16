import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/card_widget_detail.dart';

class DetailWeightRepWidgetPlaytimeWorkout extends StatelessWidget {
  const DetailWeightRepWidgetPlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardWidgetDetail(labelText: "15 kg",),
          CardWidgetDetail(labelText: "20 rep",),
        ],
      ),
    );
  }
}
