import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/home/widget/mini_card_exercise.dart';

class CardCustomHome extends StatelessWidget {
  const CardCustomHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CardCustomColor1(
        width: 250,
        height: 180,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 15, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My workout Name", style: ThemesTextStyles.textBoldWhite),
                  Icon(Icons.settings,size: 24,color: ThemesColor.white,)
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                ],
              ),
              SizedBox(height: 9,),
              Row(
                children: [
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                  MiniCardExercise(),
                  SizedBox(width: 13,),
                ],
              )
            ],
          ),
        )
    );
  }
}
