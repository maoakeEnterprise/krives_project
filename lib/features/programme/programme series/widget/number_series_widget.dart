import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class NumberSeriesWidget extends StatelessWidget {
  const NumberSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemesColor.themes[0][themeChoice],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          dropdownColor: ThemesColor.themes[2][themeChoice],
          value: 0,
          icon: Icon(Icons.arrow_drop_down,color: ThemesColor.themes[7][themeChoice],),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: ThemesColor.themes[7][themeChoice]),
          onChanged: (int? newValue) {
          },
          items: List.generate(21, (index) => DropdownMenuItem<int>(
            value: index,
            child: Text('$index'),
          ),),
        ),
      ),
    );
  }
}
