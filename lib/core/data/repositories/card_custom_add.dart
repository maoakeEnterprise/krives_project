import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class CardCustomAdd extends StatelessWidget {
  final double? height;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final String? labelText;
  const CardCustomAdd({
    super.key,
    this.height = 110,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.labelText= "",
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      height: height,
      margin: EdgeInsets.fromLTRB(left!, top!, right!, bottom!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
        boxShadow: [BoxShadow(
            offset: Offset(1,3),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.7)
        )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(labelText!,style: ThemesTextStyles.themes[5][themeChoice],),
          SizedBox(width: 14,),
          Icon(Icons.add,color: ThemesColor.themes[7][themeChoice],)
        ],
      ),
    );
  }
}