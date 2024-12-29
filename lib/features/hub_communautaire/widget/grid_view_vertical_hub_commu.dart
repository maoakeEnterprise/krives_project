import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class GridViewVerticalHubCommu extends StatelessWidget {
  const GridViewVerticalHubCommu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 2, 70, 10),
        child: GridView.count(
          childAspectRatio: 1,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3, // nombre d'éléments par ligne
          children: List.generate(
            5,
                (index) => Container(
                  margin: EdgeInsets.fromLTRB(0, 12, 18, 0),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ThemesColor.blackColor3,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
