import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class CardSecondaryMuscle extends StatelessWidget {
  final int index;

  const CardSecondaryMuscle({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.fromLTRB(0, 0, 26, 0),
        decoration: BoxDecoration(
            color: ThemesColor.themes[0][themeChoice],
            borderRadius: BorderRadius.circular(12),
            boxShadow:[ BoxShadow(
                color: Colors.black,
                offset: Offset(1, 3),
                blurRadius: 5
            )]
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 18),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7)
              ),
            ),
            Text("Pec", style: ThemesTextStyles.themes[5][themeChoice],)
          ],
        ),
      ),
    );
  }
}
