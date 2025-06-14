import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/card_widget_detail.dart';

class DetailWeightRepWidgetPlaytimeWorkout extends StatelessWidget {
  final int maxCharge;
  final int maxRep;
  const DetailWeightRepWidgetPlaytimeWorkout({super.key,required this.maxCharge,required this.maxRep});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardWidgetDetail(labelText: "$maxCharge kg",),
          CardWidgetDetail(labelText: "$maxRep rep",),
        ],
      ),
    );
  }
}
