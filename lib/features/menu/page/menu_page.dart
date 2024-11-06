import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/features/menu/widget/header_menu.dart';
import 'package:krives_project/features/menu/widget/side_menu_tile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    int themesChoice = 0;
    return Drawer(
      backgroundColor: ThemesColor.blackColor3,
      child: ListView(
        children: [
          HeaderMenu(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
            child: Divider(
              color: ThemesColor.themes[1][themesChoice],
            ),
          ),
          SideMenuTile(),
          SideMenuTile(),
          SideMenuTile(),
        ],
      ),
    );
  }
}
