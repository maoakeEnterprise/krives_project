import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/programme/program_user/services/program_action_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

enum TileType{
  folder,
  program,
  createFolder,
  createProgram,
  addProgramInFolder,
}

abstract class TileUsedForProgram{
  Widget build(BuildContext context);
  factory TileUsedForProgram(TileType type,String name,Folder folder,Program program){
    switch(type){
      case TileType.folder:
        return TileFolder(name,folder);
      case TileType.program:
        return TileProgram(program);
      case TileType.createFolder:
        return TileCreateFolder();
      case TileType.createProgram:
        return TileCreateProgram();
      case TileType.addProgramInFolder:
        return TileAddProgramInFolder();
      }
  }
}

class TileFolder implements TileUsedForProgram{
  final String name;
  final Folder folder;
  int themeChoice = 0;
  TileFolder(this.name,this.folder);
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.folder_sharp,color: ThemesColor.themes[3][themeChoice],),

      trailing: BlocBuilder<SwitchEditAppBarBloc, SwitchEditAppBarState>(
        builder: (context, state) {
          return ProgramActionServices.confirmIfThisFolderCanBeDelete(state, name) ? IconButton(
            onPressed: ProgramActionServices.actionToDeleteFolder(context,name,folder),
            icon: Icon(Icons.do_not_disturb_on_rounded,color: ThemesColor.themes[5][themeChoice],),)
          : SizedBox.shrink();
        },),

      title: Text(name,
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ProgramActionServices.actionToGoInTheFolder(context,name),
    );
  }
}
class TileProgram implements TileUsedForProgram{
  final Program program;
  int themeChoice = 0;
  TileProgram(this.program);
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.sticky_note_2_sharp,color: ThemesColor.themes[3][themeChoice],),
      title: Text(program.name,
        style: ThemesTextStyles.themes[3][themeChoice],),

      trailing: BlocBuilder<SwitchEditProgramsBloc, SwitchEditProgramsState>(
        builder: (context, state) {
          return state is ProgramsEditOn ? IconButton(
            onPressed: ProgramActionServices.actionToDeleteProgram(context),
            icon: Icon(Icons.do_not_disturb_on_rounded,color: ThemesColor.themes[5][themeChoice],),)
          : SizedBox.shrink();
          },),

      onTap: ProgramActionServices.actionToGoInProgram(context,program),
    );
  }
}

class TileCreateFolder implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.create_new_folder_sharp,color: ThemesColor.themes[3][themeChoice],),
      title: Text(SourceLangage.titleProgramsUserLangageWithPopUp[2][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ProgramActionServices.popUpAddFolderAction(context),
    );
  }
}

class TileCreateProgram implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.add_box,color: ThemesColor.themes[3][themeChoice],),
      title: Text(
        SourceLangage.titleProgramsUserLangageWithPopUp[4][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ProgramActionServices.actionToCreateProgram(context),
    );
  }
}

class TileAddProgramInFolder implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.add_box_outlined,color: ThemesColor.themes[3][themeChoice],),
      title: Text(SourceLangage.titleProgramsUserLangageWithPopUp[3][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ProgramActionServices.actionToAddProgramInTheActualFolder(context),
    );
  }
}

