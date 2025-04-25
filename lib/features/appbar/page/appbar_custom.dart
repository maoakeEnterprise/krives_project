import 'package:flutter/material.dart';
import 'package:krives_project/features/appbar/services/app_bar_function_services.dart';
import 'package:krives_project/core/theme/theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;///this is the title of the page
  final bool isCheckExerciseButton;///this bool is here to confirm if we are in the page Exercise
  final bool isCheckSeriesButton;///this bool is here to confirm if we are in the page Series
  final bool isCheckProgramButton;/// this bool is here to confirm if we are the in page program or not
  final bool isEditProgramsButton; /// this bool is here to verify if we are in a folder with programs or not
  final bool isEditFolderProgram; /// this bool is here to verify if we are in a folder with programs or not
  final bool isEditExercise; /// this bool is here to verify if we are in a folder with programs or not

  const AppBarCustom({
    super.key,
    required this.title,
    this.isCheckExerciseButton = false,
    this.isCheckSeriesButton = false,
    this.isCheckProgramButton = false,
    this.isEditProgramsButton = false,
    this.isEditFolderProgram=false,
    this.isEditExercise = false,
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;

    return AppBar(
      elevation: 5,
      title: Text(title, style: ThemeCustom.textThemes[7][chooseThemes]),
      centerTitle: true,
      actions: AppBarFunctionServices.getTheRightActionButton(context, isCheckExerciseButton, isCheckSeriesButton, isCheckProgramButton,isEditProgramsButton, isEditFolderProgram, isEditExercise),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}