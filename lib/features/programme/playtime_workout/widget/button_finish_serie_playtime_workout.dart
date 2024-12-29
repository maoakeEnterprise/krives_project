import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_timer.dart';

class ButtonFinishSeriePlaytimeWorkout extends StatelessWidget {
  const ButtonFinishSeriePlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context){
                return PopUpTimer();
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: ThemesColor.themes[4][themeChoice],
                shape: BoxShape.circle
              ),
              child: Icon(Icons.check,color: ThemesColor.themes[6][themeChoice],),
            ),
          ),
        ],
      ),
    );
  }
}
