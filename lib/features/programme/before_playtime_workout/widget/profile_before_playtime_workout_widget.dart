import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class ProfileBeforePlaytimeWorkoutWidget extends StatelessWidget {
  const ProfileBeforePlaytimeWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Row(
        children: [
          SizedBox(width: 18,),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 7,),
          Text("Devon Lane",style: ThemesTextStyles.themes[5][themeChoice],),
          SizedBox(width: 28,),
          Text("2023",style: ThemesTextStyles.themes[0][themeChoice],),
        ],
      ),
    );
  }
}
