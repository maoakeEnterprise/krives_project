import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/programme/program_user/services/program_action_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';

class ButtonPopUpFolder extends StatelessWidget {

  final bool isConfirmButton;
  final TextEditingController nameController;

  const ButtonPopUpFolder({
    super.key,
    required this.nameController,
    this.isConfirmButton = false
  });


  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return BlocBuilder<FolderBloc, FolderState>(
  builder: (context, state) {
    return GestureDetector(
      onTap: ProgramActionServices.getRightAction(isConfirmButton, context , nameController,state),
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isConfirmButton ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[1][themeChoice],
        ),
        child: Center(
          child: Text(
            isConfirmButton ? _getText(23, langageChoice) : _getText(24, langageChoice),
            style: isConfirmButton ? _getStyle(9, themeChoice) : _getStyle(8, themeChoice),
          ),
        ),
      ),
    );
  },
);
  }
  

  String _getText(int index,int langageChoice) {
    return SourceLangage.baseLangage[index][langageChoice];
  }
  TextStyle _getStyle(int index,int themeChoice) {
    return ThemesTextStyles.themes[index][themeChoice];
  }
}
