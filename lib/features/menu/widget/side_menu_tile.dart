import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({super.key});

  @override
  Widget build(BuildContext context) {
    int choiceThemes = 0;
    return Container(
      decoration: BoxDecoration(
        color: ThemesColor.blackColor2,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
        )
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 15, 6),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        iconColor: ThemesColor.white,
        textColor: ThemesColor.white,
        leading: Icon(
          Icons.home_filled,
        ),
        title: Text("data",),
      ),
    );
  }
}
