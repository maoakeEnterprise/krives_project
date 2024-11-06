import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/theme.dart';

class TitleWidgetV2 extends StatelessWidget {
  final IconData icon;
  final String text;
  const TitleWidgetV2({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final int chooseThemes = 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 24, 0, 0),
      child: Row(
        children: [
          Text(text,style: ThemeCustom.textThemes[5][chooseThemes],),
          Container(width: 10,),
          Icon(
              icon,
              size: 20,
              color: ThemeCustom.colorThemes[7][chooseThemes]
          )
        ],
      ),
    );
  }
}