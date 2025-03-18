import 'package:flutter/material.dart';
import 'package:krives_project/core/services_action/app_bar_button_services.dart';
import 'package:krives_project/core/theme/theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;//title of the page
  final bool isCreateExoButton;///this bool is here to confirm if we are in the page Exercise
  final bool isCreateSeriesButton;///this bool is here to confirm if we are in the page Series
  final bool isProgramButton;/// this bool is here to confirm if we are the in page program or not
  final bool isEditProgramsButton; /// this bool is here to verify if we are in a folder with programs or not

  const AppBarCustom({
    super.key,
    required this.title,
    this.isCreateExoButton = false,
    this.isCreateSeriesButton = false,
    this.isProgramButton = false,
    this.isEditProgramsButton = false,
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;

    return AppBar(
      elevation: 5,
      title: Text(title, style: ThemeCustom.textThemes[7][chooseThemes]),
      centerTitle: true,
      actions: AppBarButtonServices.getTheRightActionButton(context, isCreateExoButton, isCreateSeriesButton, isProgramButton,isEditProgramsButton),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}