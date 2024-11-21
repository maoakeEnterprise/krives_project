import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';

class ButtonRemoveWidgetTimer extends StatelessWidget {
  const ButtonRemoveWidgetTimer({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 28, 0, 0),
      child: Row(
        children: [
          SizedBox(width: 25,),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ThemesColor.themes[0][themeChoice],
            ),
            child: Icon(Icons.horizontal_rule,
              color: ThemesColor.red1,
            ),
          ),
        ],
      ),
    );
  }
}
