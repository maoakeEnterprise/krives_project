import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/program_user/services/program_action_services.dart';

class ButtonAddProgram extends StatelessWidget {

  final String idUser;///we need to get the idUser to get a link between the user and the program we will create.
  final TextEditingController nameController;
  final String nameFolder;
  const ButtonAddProgram({
    super.key,
    this.idUser = '',/// iduser = '' as default like this we can identify if its a button confirm or not if idUser != '' then it's a button confirm.
    required this.nameController, /// this will contain the controller
    required this.nameFolder,
  });

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        /// idUser is used as comparison like this we can set the right function for our button, IDEM for the color, text, textStyle used.
        onTap: idUser == '' ?
            ProgramActionServices.actionToCancelProgram(context)
            :
            ProgramActionServices.actionToCreateProgram(context,nameController,nameFolder),
        child: Ink(
          width: 150,
          height: 30,
          decoration: BoxDecoration(
            color: ThemesColor.themes[idUser == '' ? 1 : 4][themeChoice],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              SourceLangage.baseLangage[idUser == '' ? 24 : 23][langageChoice],
              style: ThemesTextStyles.themes[idUser == '' ? 8 : 9][themeChoice],
            ),
          ),
        ),
      ),
    );
  }
}
