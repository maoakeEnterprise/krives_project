import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;

    return AppBar(
      backgroundColor: ThemeCustom.colorThemes[1][chooseThemes],
      elevation: 5,
      shadowColor: ThemeCustom.colorThemes[6][chooseThemes],
      surfaceTintColor: ThemeCustom.colorThemes[1][chooseThemes],
      leading: Icon(
        Icons.menu,
        size: 24,
        color: ThemeCustom.colorThemes[7][chooseThemes],
      ),
      flexibleSpace: Container(
        alignment: Alignment.center,
        child: Text(title, style: ThemeCustom.textThemes[7][chooseThemes]),
      ),
      title: null,
      toolbarHeight: 60,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}