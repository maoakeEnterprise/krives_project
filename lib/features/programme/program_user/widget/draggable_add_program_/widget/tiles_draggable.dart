import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/service/service_draggable_program.dart';

class TilesDraggableProgram extends StatelessWidget {
  final Program program;
  final String nameFolder;

  const TilesDraggableProgram({
    super.key,
    required this.program,
    required this.nameFolder,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return ListTile(
      leading: Icon(Icons.sticky_note_2_sharp,color: ThemesColor.themes[7][themeChoice],),
      title: Text(program.name,style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ServiceDraggableProgram.actionToAddProgramInFolder(context,nameFolder,program),
    );
  }
}
