import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';

class MiniCardExoBeforePlaytimeWorkout extends StatelessWidget {

  final double width;
  final double height;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final Muscle muscle;

  const MiniCardExoBeforePlaytimeWorkout({
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    required this.muscle,
    required this.width,
    required this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Image.asset(muscle.imageMuscle),

    );
  }
}
